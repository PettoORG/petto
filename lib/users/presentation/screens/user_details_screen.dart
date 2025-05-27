import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/shared/constant.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/files/application/files_state.dart' as fs;
import 'package:petto/core/files/application/files_storage_path_provider.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/constant/crop_options_constants.dart';
import 'package:petto/core/files/presentation/widgets/single_file.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/users/application/user_notifier.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/presentation/widgets/user_form.dart';
import 'package:petto/users/shared/providers.dart';

class UserDetailsScreen extends ConsumerStatefulWidget {
  const UserDetailsScreen({
    super.key,
    this.files = const [],
  });

  final List<AppFileViewModel> files;

  @override
  ConsumerState<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {
  /// Folder for files (nested in document).
  String filesFolder = 'files';

  /// Getter for "form" and "files" family.
  String get family => usersModule;

  /// Returns true if there are pending files to be uploaded or deleted.
  bool get hasFilePending => ref.read(filesNotifierProvider(family).notifier).hasFilesPending;

  /// Collection path for user documents.
  String get collectionPath => ref.read(userCollectionPathProvider);

  /// Builds the storage path for files.
  String? get storagePath => _buildStoragePath();

  /// Builds the Firestore path for files.
  String? get firestorePath => _buildFirestorePath();

  @override
  Widget build(BuildContext context) {
    // Listen to user load/save events
    // User notifier listener
    ref.listen<BaseEntityState<User>>(
      userNotifierProvider,
      (previous, next) async {
        if (next is FailureState<User>) {
          showCustomFlash(context, next.failure.message ?? 'error.unexpectedError'.tr());
        }

        if (next is Data<User>) {
          // Process initial files if provided
          if (widget.files.isNotEmpty) {
            ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
          }

          // If there are pending files, set paths and resume processing
          if (hasFilePending) {
            final newStorage = _buildStoragePath();
            final newFs = _buildFirestorePath();
            ref.read(filesStoragePathProvider(family).notifier).set(newStorage);
            ref.read(filesFirestorePathProvider(family).notifier).set(newFs);

            await ref.read(filesNotifierProvider(family).notifier).processFiles();
          }
        }
      },
    );

    // Listen to file upload state changes
    ref.listen<fs.FilesState>(
      filesNotifierProvider(family),
      (previous, next) {
        switch (next) {
          case fs.Loading():
            break;
          case fs.Loaded(files: final files, status: final status):
            if (status == fs.LoadedStatus.fromDatabase && files.isEmpty && widget.files.isNotEmpty) {
              ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
            }
            if (status == fs.LoadedStatus.afterProcessing) {
              if (hasFilePending) {
                showCustomFlash(context, 'error.filesNotProcessed'.tr());
                return;
              }
              _setTouchedState(hasFilePending);
            }
            break;
        }
      },
    );

    final formIsLoading = ref.watch(userNotifierProvider.select((state) => state is Loading<User>));
    final filesIsLoading = ref.watch(filesNotifierProvider(family).select((state) => state is fs.Loading));
    final loading = formIsLoading || filesIsLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'.tr()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppThemeSpacing.extraSmallH),
                SingleFile(
                  family: family,
                  storagePath: storagePath,
                  firestorePath: firestorePath,
                  cropOptions: circle300x300,
                  onFileChanged: (file) => _setTouchedState(hasFilePending),
                  showCancelAction: false,
                  showDeleteAction: false,
                  showRetryAction: false,
                  isLoading: loading,
                  unselectedFileWidget: (onImageTap) => _SelectAvatar(onImageTap),
                  borderRadius: BorderRadius.circular(AppThemeSpacing.extraLargeH),
                  thumbnailHeight: AppThemeSpacing.ultraH,
                  thumbnailWidth: AppThemeSpacing.ultraH,
                ),
                SizedBox(height: AppThemeSpacing.smallH),
                UserForm(
                  setTouchedState: (touched) {
                    _setTouchedState(touched || hasFilePending);
                  },
                  beforeSave: (entity) async {
                    // Prevent breaking file list
                    ref.read(filesNotifierProvider(family).notifier).processFiles(hold: true);
                  },
                ),
              ],
            ),
          ),
          if (loading)
            Container(
              height: 1.sh,
              width: 1.sw,
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: .5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  void _setTouchedState(bool touched) {
    if (touched) {
      ref.read(touchedProvider(usersModule).notifier).touched();
    } else {
      ref.read(touchedProvider(usersModule).notifier).untouched();
    }
  }

  String _buildStoragePath() {
    final id = ref.read(userProvider).value!.id;
    return '$collectionPath/$id/$filesFolder';
  }

  String _buildFirestorePath() {
    final id = ref.read(userProvider).value!.id;
    return '$collectionPath/$id/$filesFolder';
  }
}

class _SelectAvatar extends StatelessWidget {
  const _SelectAvatar(this.onImageTap);

  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: AppThemeSpacing.ultraH,
      width: AppThemeSpacing.ultraH,
      child: Stack(
        children: [
          Container(
            height: AppThemeSpacing.ultraH,
            width: AppThemeSpacing.ultraH,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [AppThemeShadow.small],
            ),
            child: Center(
              child: Icon(
                Icons.person,
                size: AppThemeSpacing.tripleXLH,
                color: colorScheme.primary,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onImageTap,
                borderRadius: BorderRadius.circular(AppThemeSpacing.smallH),
                child: Ink(
                  height: .065.sh,
                  width: .065.sh,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [AppThemeShadow.small],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: AppThemeSpacing.smallH,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

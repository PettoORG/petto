// lib/users/presentation/user_details_screen.dart
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
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/users/application/user_notifier.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/presentation/widgets/user_form.dart';
import 'package:petto/users/shared/providers.dart';

class UserDetailsScreen extends StatefulHookConsumerWidget {
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
    ref.listen<BaseEntityState<User>>(
      userNotifierProvider,
      (previous, next) {
        if (next is FailureState<User>) {
          final msg = next.failure.message ?? 'error.unexpectedError'.tr();
          showCustomFlash(context, msg);
        }
      },
    );

    // Listen for changes in the file uploading state.
    ref.listen<fs.FilesState>(
      filesNotifierProvider(family),
      (previous, next) {
        switch (next) {
          // Loading branch: no action
          case fs.Loading():
            break;

          // Loaded branch: aplicamos la lógica que antes estaba en `loaded: (…)`
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
          icon: const Icon(Icons.arrow_back),
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
                _UserAvatar(),
                SizedBox(height: AppThemeSpacing.smallH),
                UserForm(),
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

  /// Updates the "touched" state of the form depending on whether there are pending file changes.
  void _setTouchedState(bool touched) {
    if (touched) {
      ref.read(touchedProvider(usersModule).notifier).touched();
    } else {
      ref.read(touchedProvider(usersModule).notifier).untouched();
    }
  }

  /// Builds the storage path for files, using the user ID.
  String _buildStoragePath() {
    final id = ref.read(userProvider).value!.id;
    return '$collectionPath/$id/$filesFolder';
  }

  /// Builds the Firestore path for files, using the user ID.
  String _buildFirestorePath() {
    final id = ref.read(userProvider).value!.id;
    return '$collectionPath/$id/$filesFolder';
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 2;

    return Center(
      child: SizedBox(
        width: avatarSize,
        height: avatarSize,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [AppThemeShadow.small],
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: AppThemeSpacing.doubleXLH,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [AppThemeShadow.small],
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: AppThemeSpacing.smallH,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

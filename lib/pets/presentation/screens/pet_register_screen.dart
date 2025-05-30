import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/files/application/files_state.dart' as fs;
import 'package:petto/core/files/application/files_storage_path_provider.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/pets/app/pet_notifier.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/presentation/widgets/pet_register_form.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:petto/pets/shared/providers.dart';

class PetRegisterScreen extends StatefulHookConsumerWidget {
  const PetRegisterScreen({
    super.key,
    required this.id,
    this.files = const [],
  });

  final String id;
  final List<AppFileViewModel> files;

  @override
  ConsumerState<PetRegisterScreen> createState() => _PetRegisterScreenState();
}

class _PetRegisterScreenState extends ConsumerState<PetRegisterScreen> {
  /// Folder for files (nested in document).
  String filesFolder = 'files';

  /// Getter for "form" and "files" family.
  String get family => petsModule;

  /// Returns true if there are pending files to be uploaded or deleted.
  bool get hasFilePending => ref.read(filesNotifierProvider(family).notifier).hasFilesPending;

  /// Collection path for user documents.
  String get collectionPath => ref.read(petCollectionPathProvider);

  /// Builds the storage path for files.
  String? get storagePath => _buildStoragePath(widget.id);

  /// Builds the Firestore path for files.
  String? get firestorePath => _buildFirestorePath(widget.id);

  PetSpecie? _selectedSpecie;
  @override
  Widget build(BuildContext context) {
    ref.listen<BaseEntityState<Pet>>(
      petNotifierProvider,
      (previous, next) async {
        if (next is FailureState<Pet>) {
          showCustomFlash(
            context,
            next.failure.message ?? 'error.unexpectedError'.tr(),
          );
        }

        if (next is Data<Pet>) {
          final pet = next.entity;

          if (widget.files.isNotEmpty) {
            ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
          }

          if (hasFilePending) {
            final newStoragePath = _buildStoragePath(pet.id);
            final newFirestorePath = _buildFirestorePath(pet.id);

            ref.read(filesStoragePathProvider(family).notifier).set(newStoragePath);
            ref.read(filesFirestorePathProvider(family).notifier).set(newFirestorePath);

            await ref.read(filesNotifierProvider(family).notifier).processFiles();
          }
        }
        if (next is Deleted<Pet>) {
          if (context.mounted) {
            context.pop();
          }
        }
      },
    );

    // Files notifier listener ― keeps the UI in sync with file processing status.
    ref.listen<fs.FilesState>(
      filesNotifierProvider(family),
      (previous, next) {
        switch (next) {
          case fs.Loading():
            // Nothing to do while processing / picking.
            break;

          case fs.Loaded(files: final files, status: final status):
            // Database loaded an empty list but we came with initial files → inject them.
            if (status == fs.LoadedStatus.fromDatabase && files.isEmpty && widget.files.isNotEmpty) {
              ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
            }

            // Processing finished → verify pending work and update “touched” state.
            if (status == fs.LoadedStatus.afterProcessing) {
              if (hasFilePending) {
                showCustomFlash(context, 'error.filesNotProcessed'.tr());
                return;
              }
              _setTouchedState(hasFilePending); // false → marks form as clean
            }
            break;
        }
      },
    );

    final formIsLoading = ref.watch(petNotifierProvider.select((state) => state is Loading<Pet>));
    final filesIsLoading = ref.watch(filesNotifierProvider(family).select((state) => state is fs.Loading));
    final loading = formIsLoading || filesIsLoading;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          body: Column(
            spacing: AppThemeSpacing.extraSmallH,
            children: [
              Center(child: _PetAvatar(specie: _selectedSpecie)),
              PetRegisterForm(
                id: widget.id,
                setTouchedState: (touched) {
                  _setTouchedState(touched || hasFilePending);
                },
                beforeSave: (entity) async {
                  // Prevent breaking file list
                  ref.read(filesNotifierProvider(family).notifier).processFiles(hold: true);
                },
                onSpecieChanged: (specie) {
                  setState(() {
                    _selectedSpecie = specie;
                  });
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
    );
  }

  void _setTouchedState(bool touched) {
    if (touched) {
      ref.read(touchedProvider(petsModule).notifier).touched();
    } else {
      ref.read(touchedProvider(petsModule).notifier).untouched();
    }
  }

  String _buildStoragePath(String? id) {
    return '$collectionPath/$id/$filesFolder';
  }

  String _buildFirestorePath(String? id) {
    return '$collectionPath/$id/$filesFolder';
  }
}

class _PetAvatar extends StatelessWidget {
  const _PetAvatar({required this.specie});

  final PetSpecie? specie;

  @override
  Widget build(BuildContext context) {
    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 2;
    final String assetPath = specie == PetSpecie.cat ? 'assets/images/cat.png' : 'assets/images/dog.png';

    final Widget imageWidget = assetPath.endsWith('.svg')
        ? SvgPicture.asset(
            assetPath,
            fit: BoxFit.cover,
            width: avatarSize,
            height: avatarSize,
          )
        : Image.asset(
            assetPath,
            fit: BoxFit.cover,
            width: avatarSize,
            height: avatarSize,
          );

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [AppThemeShadow.small],
            ),
            child: ClipOval(child: imageWidget),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                boxShadow: [AppThemeShadow.small],
              ),
              child: Icon(
                Icons.camera_alt,
                size: AppThemeSpacing.smallH,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

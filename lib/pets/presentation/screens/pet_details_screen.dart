import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
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
import 'package:petto/pets/app/pet_notifier.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/presentation/widgets/pet_form.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:petto/pets/shared/providers.dart';
import 'package:petto/home/router.dart';

/// Screen used to edit or register a Pet entity.
///
/// When [basic] is `true` behaves like the former `PetRegisterScreen`,
/// rendering only the essential fields.
class PetDetailsScreen extends StatefulHookConsumerWidget {
  const PetDetailsScreen({
    super.key,
    required this.id,
    this.files = const [],
    this.basic = false,
  });

  final String id;
  final List<AppFileViewModel> files;
  final bool basic;

  @override
  ConsumerState<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends ConsumerState<PetDetailsScreen> {
  /// Folder for files (nested in document).
  final String filesFolder = 'files';

  /// Getter for "form" and "files" family.
  String get family => petsModule;

  /// Returns true if there are pending files to be uploaded or deleted.
  bool get hasFilePending => ref.read(filesNotifierProvider(family).notifier).hasFilesPending;

  /// Collection path for pet documents.
  String get collectionPath => ref.read(petCollectionPathProvider);

  /// Builds the storage path for files.
  String? get storagePath => _buildStoragePath(widget.id);

  /// Builds the Firestore path for files.
  String? get firestorePath => _buildFirestorePath(widget.id);

  PetBreed? _selectedBreed;
  bool _initialEntityLoaded = false;

  @override
  Widget build(BuildContext context) {
    // Helper to return to the Home screen
    void goHome() {
      if (!mounted) return;
      context.go(HomeRoute().location);
    }

    // Pet state listener
    ref.listen<BaseEntityState<Pet>>(
      petNotifierProvider,
      (previous, next) async {
        if (next is FailureState<Pet>) {
          showCustomFlash(
            context,
            next.failure.message ?? 'error.unexpectedError'.tr(),
          );
          return;
        }

        if (widget.basic) {
          if (next is Data<Pet> && !_initialEntityLoaded) {
            _initialEntityLoaded = true;
            return;
          }

          final saveCompleted = previous is Loading<Pet> && next is Data<Pet>;

          if (saveCompleted) {
            final pet = next.entity;

            if (widget.files.isNotEmpty) {
              ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
            }

            if (hasFilePending) {
              ref.read(filesStoragePathProvider(family).notifier).set(_buildStoragePath(pet.id));
              ref.read(filesFirestorePathProvider(family).notifier).set(_buildFirestorePath(pet.id));
              await ref.read(filesNotifierProvider(family).notifier).processFiles();
            } else {
              goHome();
            }
          }
        } else if (next is Data<Pet>) {
          if (widget.files.isNotEmpty) {
            ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
          }

          if (hasFilePending) {
            ref.read(filesStoragePathProvider(family).notifier).set(_buildStoragePath(widget.id));
            ref.read(filesFirestorePathProvider(family).notifier).set(_buildFirestorePath(widget.id));
            await ref.read(filesNotifierProvider(family).notifier).processFiles();
          }
        }
      },
    );

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
            if (widget.basic) {
              final finishedProcessing =
                  status == fs.LoadedStatus.afterProcessing && !hasFilePending;
              if (finishedProcessing) {
                _setTouchedState(false);
                goHome();
              }
            } else if (status == fs.LoadedStatus.afterProcessing) {
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

    final formIsLoading = ref.watch(petNotifierProvider.select((state) => state is Loading<Pet>));
    final filesIsLoading = ref.watch(filesNotifierProvider(family).select((state) => state is fs.Loading));
    final loading = formIsLoading || filesIsLoading;

    return Stack(
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                title: Text(widget.basic ? 'registerPet'.tr() : 'editPet'.tr()),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => context.pop(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
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
                        onFileChanged: (_) => _setTouchedState(hasFilePending),
                        showCancelAction: false,
                        showDeleteAction: false,
                        showRetryAction: false,
                        isLoading: loading,
                        unselectedFileWidget: (onImageTap) => _PetAvatar(breed: _selectedBreed, onImageTap: onImageTap),
                        borderRadius: BorderRadius.circular(AppThemeSpacing.extraLargeH),
                        thumbnailHeight: AppThemeSpacing.ultraH,
                        thumbnailWidth: AppThemeSpacing.ultraH,
                      ),
                      SizedBox(height: AppThemeSpacing.smallH),
                      PetForm(
                        id: widget.id,
                        basic: widget.basic,
                        setTouchedState: (touched) {
                          _setTouchedState(touched || hasFilePending);
                        },
                        beforeSave: (entity) async {
                          ref.read(filesNotifierProvider(family).notifier).processFiles(hold: true);
                        },
                        onBreedChanged: (breed) {
                          setState(() => _selectedBreed = breed);
                        },
                      ),
                    ],
                  ),
                ),
              )
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
    final notifier = ref.read(touchedProvider(petsModule).notifier);
    touched ? notifier.touched() : notifier.untouched();
  }

  String _buildStoragePath(String id) => '$collectionPath/$id/$filesFolder';
  String _buildFirestorePath(String id) => '$collectionPath/$id/$filesFolder';
}

class _PetAvatar extends StatelessWidget {
  const _PetAvatar({
    required this.breed,
    required this.onImageTap,
  });

  final PetBreed? breed;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 2;

    final String? networkUrl = breed?.defaultImageUrl;

    final Widget imageWidget = networkUrl != null
        ? CachedNetworkImage(
            imageUrl: networkUrl,
            fit: BoxFit.cover,
            width: avatarSize,
            height: avatarSize,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surface,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: avatarSize,
                width: avatarSize,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [AppThemeShadow.small],
                ),
              ),
            ),
            errorWidget: (_, __, ___) => Icon(Icons.image_not_supported, size: avatarSize * .5),
          )
        : Icon(Icons.pets_rounded, size: avatarSize * .5, color: Theme.of(context).colorScheme.primaryContainer);

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Stack(
        children: [
          Container(
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
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onImageTap,
                borderRadius: BorderRadius.circular(AppThemeSpacing.smallH),
                child: Ink(
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
            ),
          ),
        ],
      ),
    );
  }
}

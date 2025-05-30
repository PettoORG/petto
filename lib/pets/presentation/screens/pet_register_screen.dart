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
import 'package:petto/core/files/constant/crop_options_constants.dart';
import 'package:petto/core/files/presentation/widgets/single_file.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/home/router.dart';
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

  /// Collection path for pet documents.
  String get collectionPath => ref.read(petCollectionPathProvider);

  /// Builds the storage path for files.
  String? get storagePath => _buildStoragePath(widget.id);

  /// Builds the Firestore path for files.
  String? get firestorePath => _buildFirestorePath(widget.id);

  /// Flag to ignore the very first Data emitted when the screen opens.
  bool _initialEntityLoaded = false;

  PetSpecie? _selectedSpecie;

  @override
  Widget build(BuildContext context) {
    // Navigation helper
    void goHome(BuildContext context) {
      if (!mounted) return;
      context.go(HomeRoute().location);
    }

    // Pet state listener
    ref.listen<BaseEntityState<Pet>>(
      petNotifierProvider,
      (prev, next) async {
        // Show any failure.
        if (next is FailureState<Pet>) {
          showCustomFlash(
            context,
            next.failure.message ?? 'error.unexpectedError'.tr(),
          );
          return;
        }

        // Skip the first Data event that belongs to the initial load.
        if (next is Data<Pet> && !_initialEntityLoaded) {
          _initialEntityLoaded = true;
          return;
        }

        // Detect the transition produced by save/create → loading → data.
        final saveCompleted = prev is Loading<Pet> && next is Data<Pet>;

        if (saveCompleted) {
          final pet = next.entity;

          // Queue files that arrived before pressing “Continuar”.
          if (widget.files.isNotEmpty) {
            ref.read(filesNotifierProvider(family).notifier).processFiles(files: widget.files);
          }

          // If there are pending files, configure paths and process them.
          // Otherwise, go directly to Home.
          if (hasFilePending) {
            ref.read(filesStoragePathProvider(family).notifier).set(_buildStoragePath(pet.id));
            ref.read(filesFirestorePathProvider(family).notifier).set(_buildFirestorePath(pet.id));
            await ref.read(filesNotifierProvider(family).notifier).processFiles();
          } else {
            goHome(context);
          }
        }
      },
    );

    ref.listen<fs.FilesState>(
      filesNotifierProvider(family),
      (prev, next) {
        final finishedProcessing =
            next is fs.Loaded && next.status == fs.LoadedStatus.afterProcessing && !hasFilePending;

        if (finishedProcessing) {
          _setTouchedState(false);
          goHome(context);
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
                title: Text('Registra tu mascota'.tr()),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  spacing: AppThemeSpacing.extraSmallH,
                  children: [
                    Center(
                      child: SingleFile(
                        family: family,
                        storagePath: storagePath,
                        firestorePath: firestorePath,
                        cropOptions: circle300x300,
                        onFileChanged: (_) => _setTouchedState(hasFilePending),
                        showCancelAction: false,
                        showDeleteAction: false,
                        showRetryAction: false,
                        isLoading: loading,
                        unselectedFileWidget: (onImageTap) => _PetAvatar(
                          specie: _selectedSpecie,
                          onImageTap: onImageTap,
                        ),
                        borderRadius: BorderRadius.circular(AppThemeSpacing.extraLargeH),
                        thumbnailHeight: AppThemeSpacing.ultraH,
                        thumbnailWidth: AppThemeSpacing.ultraH,
                      ),
                    ),
                    PetRegisterForm(
                      id: widget.id,
                      setTouchedState: (touched) {
                        _setTouchedState(touched || hasFilePending);
                      },
                      beforeSave: (_) async {
                        // Prevent breaking file list
                        ref.read(filesNotifierProvider(family).notifier).processFiles(hold: true);
                      },
                      onSpecieChanged: (specie) {
                        setState(() => _selectedSpecie = specie);
                      },
                    ),
                    SizedBox.shrink()
                  ],
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

  String _buildStoragePath(String? id) => '$collectionPath/$id/$filesFolder';
  String _buildFirestorePath(String? id) => '$collectionPath/$id/$filesFolder';
}

class _PetAvatar extends StatelessWidget {
  const _PetAvatar({
    required this.specie,
    required this.onImageTap,
  });

  final PetSpecie? specie;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 2;
    final String assetPath = specie == PetSpecie.cat ? 'assets/images/cat.png' : 'assets/images/dog.png';

    final Widget imageWidget = assetPath.endsWith('.svg')
        ? SvgPicture.asset(assetPath, fit: BoxFit.cover, width: avatarSize, height: avatarSize)
        : Image.asset(assetPath, fit: BoxFit.cover, width: avatarSize, height: avatarSize);

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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/files/application/files_storage_path_provider.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/application/files_state.dart' as fs;
import 'package:petto/core/files/constant/crop_options_constants.dart';
import 'package:petto/core/files/presentation/widgets/single_file.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/pets/app/pet_notifier.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/domain/pet_vm.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:petto/pets/shared/providers.dart';
import 'package:shimmer/shimmer.dart';

class PetOnboardingScreen extends StatefulHookConsumerWidget {
  const PetOnboardingScreen({super.key});

  @override
  ConsumerState<PetOnboardingScreen> createState() => _PetOnboardingScreenState();
}

class _PetOnboardingScreenState extends ConsumerState<PetOnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  PetSex? _selectedPetSex;
  final _formKey = GlobalKey<FormBuilderState>();
  PetBreed? _selectedBreed;

  /// Folder for files (nested in document)
  final String filesFolder = 'files';

  /// Getter for providers family
  String get family => petsModule;

  /// Helper to know if there are files pending
  bool get hasFilePending =>
      ref.read(filesNotifierProvider(family).notifier).hasFilesPending;

  /// Collection path for pets
  String get collectionPath => ref.read(petCollectionPathProvider);

  String _buildStoragePath(String id) => '$collectionPath/$id/$filesFolder';
  String _buildFirestorePath(String id) => '$collectionPath/$id/$filesFolder';

  bool _validateBasicInfo() {
    final names = ['name', 'specie', 'breed'];
    bool valid = true;
    for (final n in names) {
      final field = _formKey.currentState?.fields[n];
      field?.validate();
      if (field?.hasError ?? false) valid = false;
    }
    return valid;
  }

  bool _validateVitalInfo() {
    final names = ['birthDate', 'weight', 'size', 'foodType'];
    bool valid = true;
    for (final n in names) {
      final field = _formKey.currentState?.fields[n];
      field?.validate();
      if (field?.hasError ?? false) valid = false;
    }
    return valid;
  }

  PetVM _extractPet() {
    final get = <T>(String n) => _formKey.currentState?.fields[n]?.value as T?;
    final weightStr = get<String>('weight');

    return PetVM(
      id: '0',
      name: get('name') ?? '',
      specie: get('specie') ?? PetSpecie.other,
      breed: get('breed') ?? PetBreed.other,
      sex: _selectedPetSex ?? PetSex.male,
      birthDate: get('birthDate') ?? DateTime.now(),
      weight: double.tryParse(weightStr ?? '') ?? 0,
      size: get('size') ?? PetSize.unselected,
      photoUrl: null,
      foodType: get('foodType') ?? FoodType.unselected,
      microchipNumber: get('microchipNumber'),
    );
  }

  Future<void> _createPet() async {
    ref.read(filesNotifierProvider(family).notifier).processFiles(hold: true);
    final vm = _extractPet();
    await ref.read(petNotifierProvider.notifier).save(vm.toEntity(Pet.empty()));
  }

  @override
  void initState() {
    super.initState();

    ref.listen<BaseEntityState<Pet>>(petNotifierProvider, (previous, next) async {
      if (next is FailureState<Pet>) {
        showCustomFlash(
          context,
          next.failure.message ?? 'error.unexpectedError'.tr(),
        );
        return;
      }

      final saveCompleted = previous is Loading<Pet> && next is Data<Pet>;

      if (saveCompleted) {
        final pet = next.entity;
        ref.read(filesStoragePathProvider(family).notifier).set(
          _buildStoragePath(pet.id),
        );
        ref.read(filesFirestorePathProvider(family).notifier).set(
          _buildFirestorePath(pet.id),
        );
        await ref.read(filesNotifierProvider(family).notifier).processFiles();

        if (!hasFilePending && mounted) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });

    ref.listen<fs.FilesState>(filesNotifierProvider(family), (previous, next) {
      switch (next) {
        case fs.Loaded(files: final _, status: final status):
          final finished =
              status == fs.LoadedStatus.afterProcessing && !hasFilePending;
          if (finished && mounted) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formIsLoading =
        ref.watch(petNotifierProvider.select((state) => state is Loading<Pet>));
    final filesIsLoading = ref.watch(
        filesNotifierProvider(family).select((state) => state is fs.Loading));
    final loading = formIsLoading || filesIsLoading;
    final storagePath = ref.watch(filesStoragePathProvider(family));
    final firestorePath = ref.watch(filesFirestorePathProvider(family));

    return Scaffold(
      appBar: AppBar(
        title: Text('registerPet'.tr()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            if (_currentPage == 0) {
              context.pop();
            } else {
              _controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_currentPage + 1} de 4'),
                SizedBox(height: AppThemeSpacing.extraTinyH),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: (_currentPage + 1) / 4,
                    ),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        minHeight: 10,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: _currentPage == 3
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              onPageChanged: (i) => setState(() => _currentPage = i),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
                  child: _PetBasicInfoPage(
                    selectedPetSex: _selectedPetSex,
                    onSexChanged: (sex) => setState(() => _selectedPetSex = sex),
                    onBreedChanged: (b) => setState(() => _selectedBreed = b),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
                  child: _PetPhotoPage(
                    breed: _selectedBreed,
                    storagePath: storagePath,
                    firestorePath: firestorePath,
                    family: family,
                    loading: loading,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
                  child: const _PetVitalInformation(),
                ),
                const _PetSuccessPage(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: ElevatedButton(
              onPressed: loading
                  ? null
                  : () async {
                      if (_currentPage == 0) {
                        if (_validateBasicInfo()) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      } else if (_currentPage == 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else if (_currentPage == 2) {
                        if (_validateVitalInfo()) {
                          await _createPet();
                        }
                      }
                    },
              child: Text('next'.tr()),
            ),
          ),
          SizedBox(height: AppThemeSpacing.smallH),
        ],
      ),
    );
  }
}

class _PetVitalInformation extends StatelessWidget {
  const _PetVitalInformation();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppThemeSpacing.smallH),
        Text('Informacion vital', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        FormBuilderDateTimePicker(
          name: 'birthDate',
          locale: context.locale,
          keyboardType: TextInputType.datetime,
          format: DateFormat.yMd(context.locale.languageCode),
          inputType: InputType.date,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          decoration: InputDecoration(labelText: 'birthDate'.tr()),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              FormBuilderValidators.dateTime(errorText: 'validators.invalidDate'),
            ],
          ),
        ),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'weight',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'weight'.tr()),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                  FormBuilderValidators.numeric(),
                ]),
              ),
            ),
            SizedBox(width: AppThemeSpacing.smallW),
            Expanded(
              child: FormBuilderDropdown<PetSize>(
                name: 'size',
                decoration: InputDecoration(labelText: 'size'.tr()),
                items: PetSize.values
                    .where((s) => s != PetSize.unselected)
                    .map((s) => DropdownMenuItem(value: s, child: Text(s.displayName)))
                    .toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                ]),
              ),
            ),
          ],
        ),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        FormBuilderDropdown<FoodType>(
          name: 'foodType',
          decoration: InputDecoration(labelText: 'foodType'.tr()),
          items: FoodType.values
              .where((f) => f != FoodType.unselected)
              .map((f) => DropdownMenuItem(value: f, child: Text(f.displayName)))
              .toList(),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
          ]),
        ),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        FormBuilderTextField(
          name: 'microchipNumber',
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'microchipNumberOptional'.tr()),
        ),
      ],
    );
  }
}

class _PetBasicInfoPage extends StatefulWidget {
  final PetSex? selectedPetSex;
  final ValueChanged<PetSex> onSexChanged;
  final ValueChanged<PetBreed?> onBreedChanged;

  const _PetBasicInfoPage({
    required this.selectedPetSex,
    required this.onSexChanged,
    required this.onBreedChanged,
  });

  @override
  State<_PetBasicInfoPage> createState() => _PetBasicInfoPageState();
}

class _PetBasicInfoPageState extends State<_PetBasicInfoPage> {
  PetSpecie? _selectedSpecie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final availableBreeds = _selectedSpecie == null
        ? <PetBreed>[]
        : PetBreed.values.where((b) => b.specie == _selectedSpecie).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppThemeSpacing.smallH),
        Text('Informacion basica', style: textTheme.titleLarge),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        FormBuilderTextField(
          name: 'name',
          keyboardType: TextInputType.name,
          decoration: InputDecoration(labelText: 'name'.tr()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
          ]),
        ),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        Row(
          children: [
            Expanded(
              child: FormBuilderDropdown<PetSpecie>(
                name: 'specie',
                decoration: InputDecoration(labelText: 'specie'.tr()),
                items: PetSpecie.values
                    .map((specie) => DropdownMenuItem(
                          value: specie,
                          child: Text(specie.displayName),
                        ))
                    .toList(),
                validator: FormBuilderValidators.required(
                  errorText: 'validators.fieldRequired'.tr(),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedSpecie = value;
                    FormBuilder.of(context)
                        ?.fields['breed']
                        ?.didChange(null);
                  });
                },
              ),
            ),
            SizedBox(width: AppThemeSpacing.smallW),
            Expanded(
              child: FormBuilderDropdown<PetBreed>(
                name: 'breed',
                decoration: InputDecoration(labelText: 'breed'.tr()),
                key: ValueKey(_selectedSpecie),
                items: availableBreeds
                    .map((breed) => DropdownMenuItem(
                          value: breed,
                          child: Text(breed.displayName),
                        ))
                    .toList(),
                onChanged: widget.onBreedChanged,
                validator: FormBuilderValidators.required(
                  errorText: 'validators.fieldRequired'.tr(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        Row(
          children: [
            PetSexSelectionButton(
              sex: PetSex.male,
              selectedSex: widget.selectedPetSex,
              onSelect: () => widget.onSexChanged(PetSex.male),
            ),
            SizedBox(width: AppThemeSpacing.smallW),
            PetSexSelectionButton(
              sex: PetSex.female,
              selectedSex: widget.selectedPetSex,
              onSelect: () => widget.onSexChanged(PetSex.female),
            ),
          ],
        ),
      ],
    );
  }
}

class _PetPhotoPage extends StatelessWidget {
  const _PetPhotoPage({
    required this.breed,
    required this.family,
    required this.storagePath,
    required this.firestorePath,
    required this.loading,
  });

  final PetBreed? breed;
  final String family;
  final String? storagePath;
  final String? firestorePath;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppThemeSpacing.smallH),
        Text(
          'Vamos a ver esa carita!',
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppThemeSpacing.extraTinyH),
        Text(
          'Una foto de perfil ayuda a identificar a tu mascota y hace que su perfil sea mas personal',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppThemeSpacing.smallH),
        SingleFile(
          family: family,
          storagePath: storagePath,
          firestorePath: firestorePath,
          cropOptions: circle300x300,
          showCancelAction: false,
          showDeleteAction: false,
          showRetryAction: false,
          isLoading: loading,
          unselectedFileWidget: (onImageTap) =>
              _PetAvatar(breed: breed, onImageTap: onImageTap),
          borderRadius: BorderRadius.circular(AppThemeSpacing.extraLargeH),
          thumbnailHeight: AppThemeSpacing.ultraH,
          thumbnailWidth: AppThemeSpacing.ultraH,
        ),
      ],
    );
  }
}

class PetSexSelectionButton extends StatelessWidget {
  final PetSex sex;
  final PetSex? selectedSex;
  final VoidCallback onSelect;

  const PetSexSelectionButton({
    required this.sex,
    required this.selectedSex,
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedSex == sex;
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onSelect,
        icon: Icon(
          sex == PetSex.male ? Icons.male : Icons.female,
          size: AppThemeSpacing.smallH,
        ),
        label: Text(sex.displayName),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
          backgroundColor: isSelected ? colorScheme.primaryContainer : colorScheme.surface,
          foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppThemeRadius.medium),
          ),
        ),
      ),
    );
  }
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

class _PetSuccessPage extends StatelessWidget {
  const _PetSuccessPage();

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox.shrink());
  }
}

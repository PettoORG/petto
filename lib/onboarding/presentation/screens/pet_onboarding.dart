import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/files/application/files_state.dart' as fs;
import 'package:petto/core/files/application/files_storage_path_provider.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/constant/crop_options_constants.dart';
import 'package:petto/core/files/presentation/widgets/single_file.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/id_provider.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/home/router.dart';
import 'package:petto/pets/app/pet_notifier.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/domain/pet_vm.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:petto/pets/shared/providers.dart';
import 'package:shimmer/shimmer.dart';

/// On-boarding flow to create a new [Pet] entity.
/// It mirrors the behaviour from [PetDetailsScreen] but split
/// across three interactive pages plus a confirmation step.
class PetOnboardingScreen extends StatefulHookConsumerWidget {
  const PetOnboardingScreen({super.key});

  @override
  ConsumerState<PetOnboardingScreen> createState() => _PetOnboardingScreenState();
}

class _PetOnboardingScreenState extends ConsumerState<PetOnboardingScreen> {
  final PageController _pageController = PageController();
  static const int _formPages = 3;
  static const int _confirmationPageIndex = 3;
  int _currentPage = 0;

  late final ProviderSubscription _petCancel;
  late final ProviderSubscription _filesCancel;

  final String family = petsModule;
  final String filesFolder = 'files';
  String get _collectionPath => ref.read(petCollectionPathProvider);

  bool _saving = false;

  PetVM _vm = PetVM.empty();
  PetBreed? _selectedBreed;
  PetSex? _selectedSex;
  PetSpecie? _selectedSpecie;

  List<AppFileViewModel> _stagedFiles = [];

  final _basicKey = GlobalKey<FormBuilderState>();
  final _vitalKey = GlobalKey<FormBuilderState>();

  bool _basicValidated = false;
  bool _vitalValidated = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => ref.read(idProvider(petsModule).notifier).id = '0',
    );

    // Pet state listener
    _petCancel = ref.listenManual<BaseEntityState<Pet>>(
      petNotifierProvider,
      (prev, next) async {
        // Failure
        if (next is FailureState<Pet>) {
          if (mounted) {
            setState(() => _saving = false);
            showCustomFlash(
              context,
              next.failure.message ?? 'error.unexpectedError'.tr(),
            );
          }
          return;
        }

        // Success: react only if we are in a saving flow
        if (_saving && prev is Loading<Pet> && next is Data<Pet>) {
          final pet = next.entity;

          // Process staged files
          if (_stagedFiles.isNotEmpty) {
            ref.read(filesStoragePathProvider(family).notifier).set(_buildStoragePath(pet.id));
            ref.read(filesFirestorePathProvider(family).notifier).set(_buildFirestorePath(pet.id));
            await ref.read(filesNotifierProvider(family).notifier).processFiles(files: _stagedFiles);
          }

          if (mounted) {
            setState(() => _saving = false);
            _goToConfirmationPage();
          }
        }
      },
    );

    // Files state listener
    _filesCancel = ref.listenManual<fs.FilesState>(
      filesNotifierProvider(family),
      (prev, next) {
        if (next case fs.Loaded(status: fs.LoadedStatus.afterProcessing)) {
          final pending = ref.read(filesNotifierProvider(family).notifier).hasFilesPending;
          if (pending) {
            showCustomFlash(context, 'error.filesNotProcessed'.tr());
          }
        }
      },
    );
  }

  @override
  void dispose() {
    // Cancel manual listeners
    _petCancel.close();
    _filesCancel.close();
    // Dispose PageController
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canPop = _currentPage == 0;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) async {
        /* PopScope handles both system back and AppBar back */
        if (didPop) return; // allowed by framework
        if (_currentPage == _confirmationPageIndex) return;
        if (_currentPage == 0) {
          context.pop();
        } else {
          _previousPage();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('registerPet'.tr()),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  if (canPop) {
                    context.pop();
                  } else {
                    _previousPage();
                  }
                },
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_currentPage < _formPages) _progressHeader(),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _BasicInfoPage(
                        formKey: _basicKey,
                        specie: _selectedSpecie,
                        selectedBreed: _selectedBreed,
                        selectedSex: _selectedSex,
                        autovalidate: _basicValidated,
                        onSpecieChanged: (s) => setState(() {
                          _selectedSpecie = s;
                          _selectedBreed = null;
                        }),
                        onBreedChanged: (b) => setState(() => _selectedBreed = b),
                        onSexChanged: (s) => setState(() => _selectedSex = s),
                        initialName: _vm.name,
                      ),
                      _PhotoPage(
                        breed: _selectedBreed,
                        onFileChanged: _onFileChanged,
                      ),
                      _VitalInfoPage(
                        formKey: _vitalKey,
                        autovalidate: _vitalValidated,
                        initialWeight: _vm.weight != 0 ? _vm.weight : null,
                      ),
                      _ConfirmationPage(),
                    ],
                  ),
                ),
                _bottomButton(),
                SizedBox(height: AppThemeSpacing.smallH),
              ],
            ),
          ),
          if (_saving || ref.watch(petNotifierProvider.select((s) => s is Loading<Pet>)))
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

  Widget _progressHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${_currentPage + 1} / $_formPages'),
          SizedBox(height: AppThemeSpacing.extraTinyH),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: (_currentPage + 1) / _formPages,
              ),
              duration: const Duration(milliseconds: 300),
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                minHeight: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    final label = _currentPage == _formPages - 1
        ? 'save'.tr()
        : _currentPage == _confirmationPageIndex
            ? 'finish'.tr()
            : 'next'.tr();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
      child: ElevatedButton(
        onPressed: _saving ? null : _onButtonPressed,
        child: Text(label),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _confirmationPageIndex) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      setState(() => _currentPage++);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      setState(() => _currentPage--);
    }
  }

  void _goToConfirmationPage() {
    _pageController.animateToPage(
      _confirmationPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    setState(() => _currentPage = _confirmationPageIndex);
  }

  Future<void> _onButtonPressed() async {
    switch (_currentPage) {
      case 0:
        final bool isBasicValid = _basicKey.currentState?.saveAndValidate(
              focusOnInvalid: false,
              autoScrollWhenFocusOnInvalid: false,
            ) ??
            false;

        if (!isBasicValid) {
          setState(() => _basicValidated = true);
          return;
        }

        _updateVmFromBasic();
        _nextPage();
        break;

      case 1:
        _nextPage();
        break;

      case 2:
        final bool isVitalValid = _vitalKey.currentState?.saveAndValidate(
              focusOnInvalid: false,
              autoScrollWhenFocusOnInvalid: false,
            ) ??
            false;

        if (!isVitalValid) {
          setState(() => _vitalValidated = true);
          return;
        }

        _updateVmFromVital();
        await _savePet();
        break;

      case 3:
        if (mounted) context.go(HomeRoute().location);
        break;
    }
  }

  void _updateVmFromBasic() {
    final data = _basicKey.currentState!;
    _vm = _vm.copyWith(
      name: data.value['name'] as String,
      specie: data.value['specie'] as PetSpecie,
      breed: data.value['breed'] as PetBreed,
      sex: _selectedSex ?? PetSex.male,
    );
  }

  void _updateVmFromVital() {
    final form = _vitalKey.currentState!;
    final weightStr = form.value['weight']?.toString();
    final weight = double.tryParse(weightStr ?? '') ?? _vm.weight;

    _vm = _vm.copyWith(
      birthDate: form.value['birthDate'] as DateTime,
      weight: weight,
      size: form.value['size'] as PetSize,
      foodType: form.value['foodType'] as FoodType,
      microchipNumber: form.value['microchipNumber'] as String,
    );
  }

  void _onFileChanged(List<AppFileViewModel> files) {
    _stagedFiles = files;
  }

  String _buildStoragePath(String id) => '$_collectionPath/$id/$filesFolder';
  String _buildFirestorePath(String id) => '$_collectionPath/$id/$filesFolder';

  Future<void> _savePet() async {
    setState(() => _saving = true);

    final Pet base = ref.read(petNotifierProvider).entity ?? Pet.empty();

    final Pet upsertData = _vm.toEntity(base);

    await ref.read(petNotifierProvider.notifier).save(upsertData);
  }
}

class _BasicInfoPage extends StatelessWidget {
  const _BasicInfoPage({
    required this.formKey,
    required this.specie,
    required this.selectedBreed,
    required this.selectedSex,
    required this.onSpecieChanged,
    required this.onBreedChanged,
    required this.autovalidate,
    required this.onSexChanged,
    required this.initialName,
  });

  final GlobalKey<FormBuilderState> formKey;
  final PetSpecie? specie;
  final PetBreed? selectedBreed;
  final PetSex? selectedSex;
  final ValueChanged<PetSpecie?> onSpecieChanged;
  final ValueChanged<PetBreed?> onBreedChanged;
  final ValueChanged<PetSex> onSexChanged;
  final String initialName;
  final bool autovalidate;

  @override
  Widget build(BuildContext context) {
    final availableBreeds = specie == null ? <PetBreed>[] : PetBreed.values.where((b) => b.specie == specie).toList();

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: FormBuilder(
        key: formKey,
        autovalidateMode: autovalidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppThemeSpacing.smallH),
              Text('basicInfo'.tr(), style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: AppThemeSpacing.extraSmallH),
              FormBuilderTextField(
                name: 'name',
                initialValue: initialName,
                decoration: InputDecoration(labelText: 'name'.tr()),
                validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              ),
              SizedBox(height: AppThemeSpacing.extraSmallH),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderDropdown<PetSpecie>(
                      name: 'specie',
                      decoration: InputDecoration(labelText: 'specie'.tr()),
                      initialValue: specie,
                      items: PetSpecie.values
                          .map((s) => DropdownMenuItem(
                                value: s,
                                child: Text(s.displayName),
                              ))
                          .toList(),
                      validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                      onChanged: onSpecieChanged,
                    ),
                  ),
                  SizedBox(width: AppThemeSpacing.smallW),
                  Expanded(
                    child: FormBuilderDropdown<PetBreed>(
                      key: ValueKey(specie),
                      name: 'breed',
                      decoration: InputDecoration(labelText: 'breed'.tr()),
                      initialValue: selectedBreed,
                      items: availableBreeds
                          .map((b) => DropdownMenuItem(
                                value: b,
                                child: Text(b.displayName),
                              ))
                          .toList(),
                      validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                      onChanged: onBreedChanged,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppThemeSpacing.extraSmallH),
              Row(
                children: [
                  _PetSexSelectionButton(
                    sex: PetSex.male,
                    selectedSex: selectedSex,
                    onSelect: () => onSexChanged(PetSex.male),
                  ),
                  SizedBox(width: AppThemeSpacing.smallW),
                  _PetSexSelectionButton(
                    sex: PetSex.female,
                    selectedSex: selectedSex,
                    onSelect: () => onSexChanged(PetSex.female),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoPage extends StatelessWidget {
  const _PhotoPage({
    required this.breed,
    required this.onFileChanged,
  });

  final PetBreed? breed;
  final void Function(List<AppFileViewModel>) onFileChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppThemeSpacing.smallH),
        Text('uploadPhotoTitle'.tr(), style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: AppThemeSpacing.extraTinyH),
        Text('uploadPhotoSubtitle'.tr(), textAlign: TextAlign.center),
        SizedBox(height: AppThemeSpacing.smallH),
        Center(
          child: SingleFile(
            family: petsModule,
            storagePath: null,
            firestorePath: null,
            cropOptions: circle300x300,
            onFileChanged: (file) => onFileChanged(file == null ? [] : [file]),
            showCancelAction: false,
            showDeleteAction: false,
            showRetryAction: false,
            unselectedFileWidget: (tap) => _PetAvatar(breed: breed, onImageTap: tap),
            borderRadius: BorderRadius.circular(AppThemeSpacing.ultraH),
            thumbnailHeight: .3.sh,
            thumbnailWidth: .3.sh,
          ),
        ),
      ],
    );
  }
}

class _VitalInfoPage extends StatelessWidget {
  const _VitalInfoPage({
    required this.formKey,
    required this.autovalidate,
    this.initialWeight,
  });

  final GlobalKey<FormBuilderState> formKey;
  final double? initialWeight;
  final bool autovalidate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: FormBuilder(
        key: formKey,
        autovalidateMode: autovalidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppThemeSpacing.smallH),
              Text('vitalInfo'.tr(), style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: AppThemeSpacing.extraSmallH),
              FormBuilderDateTimePicker(
                name: 'birthDate',
                locale: context.locale,
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
                      initialValue: initialWeight != null ? '$initialWeight' : null,
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
                      validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
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
                validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              ),
              SizedBox(height: AppThemeSpacing.extraSmallH),
              FormBuilderTextField(
                name: 'microchipNumber',
                decoration: InputDecoration(labelText: 'microchipNumber'.tr()),
                validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: AppThemeSpacing.ultraH, color: Theme.of(context).colorScheme.primary),
          SizedBox(height: AppThemeSpacing.smallH),
          Text('petCreatedSuccess'.tr(), style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _PetSexSelectionButton extends StatelessWidget {
  const _PetSexSelectionButton({
    required this.sex,
    required this.selectedSex,
    required this.onSelect,
  });

  final PetSex sex;
  final PetSex? selectedSex;
  final VoidCallback onSelect;

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
    final double avatarSize = radius * 3;
    final String? networkUrl = breed?.defaultImageUrl;

    final Widget imageWidget = networkUrl != null
        ? CachedNetworkImage(
            imageUrl: networkUrl,
            fit: BoxFit.cover,
            width: avatarSize,
            height: avatarSize,
            placeholder: (_, __) => Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surface,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: avatarSize,
                height: avatarSize,
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
                  child: Icon(Icons.camera_alt,
                      size: AppThemeSpacing.smallH, color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

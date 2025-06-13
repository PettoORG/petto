import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/domain/pet_specie.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('registerPet'.tr()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_currentPage + 1} de 5'),
                SizedBox(height: AppThemeSpacing.extraTinyH),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: (_currentPage + 1) / 5,
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
              physics: const BouncingScrollPhysics(),
              onPageChanged: (i) => setState(() => _currentPage = i),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
                  child: _PetBasicInfoPage(
                    selectedPetSex: _selectedPetSex,
                    onSexChanged: (sex) => setState(() => _selectedPetSex = sex),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
                  child: const _PetPhotoPage(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
                  child: const _PetVitalInformation(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: ElevatedButton(
              onPressed: () {
                _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
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
          decoration: InputDecoration(labelText: 'microchipNumber'.tr()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
          ]),
        ),
      ],
    );
  }
}

class _PetBasicInfoPage extends StatelessWidget {
  final PetSex? selectedPetSex;
  final ValueChanged<PetSex> onSexChanged;

  const _PetBasicInfoPage({
    required this.selectedPetSex,
    required this.onSexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppThemeSpacing.smallH),
        Text('Informacion basica', style: textTheme.titleLarge),
        SizedBox(height: AppThemeSpacing.extraSmallH),
        FormBuilderTextField(name: 'name'),
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
              ),
            ),
            SizedBox(width: AppThemeSpacing.smallW),
            Expanded(
              child: FormBuilderDropdown<PetBreed>(
                name: 'breed',
                decoration: InputDecoration(labelText: 'breed'.tr()),
                items: PetBreed.values
                    .map((breed) => DropdownMenuItem(
                          value: breed,
                          child: Text(breed.displayName),
                        ))
                    .toList(),
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
              selectedSex: selectedPetSex,
              onSelect: () => onSexChanged(PetSex.male),
            ),
            SizedBox(width: AppThemeSpacing.smallW),
            PetSexSelectionButton(
              sex: PetSex.female,
              selectedSex: selectedPetSex,
              onSelect: () => onSexChanged(PetSex.female),
            ),
          ],
        ),
      ],
    );
  }
}

class _PetPhotoPage extends StatelessWidget {
  const _PetPhotoPage();

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
        // SingleFile(
        //   family: family,
        //   storagePath: storagePath,
        //   firestorePath: firestorePath,
        //   cropOptions: circle300x300,
        //   onFileChanged: (_) => _setTouchedState(hasFilePending),
        //   showCancelAction: false,
        //   showDeleteAction: false,
        //   showRetryAction: false,
        //   isLoading: loading,
        //   unselectedFileWidget: (onImageTap) => _PetAvatar(breed: _selectedBreed, onImageTap: onImageTap),
        //   borderRadius: BorderRadius.circular(AppThemeSpacing.extraLargeH),
        //   thumbnailHeight: AppThemeSpacing.ultraH,
        //   thumbnailWidth: AppThemeSpacing.ultraH,
        // ),
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

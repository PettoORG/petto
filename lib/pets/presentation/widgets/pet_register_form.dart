import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/form/application/form_state_interface.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/home/router.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/domain/pet_vm.dart';
import 'package:petto/pets/shared/constant.dart';

class PetRegisterForm extends StatefulHookConsumerWidget {
  const PetRegisterForm({
    super.key,
    required this.id,
    this.setTouchedState,
    this.beforeSave,
  });

  final String id;
  final void Function(bool touched)? setTouchedState;
  final Future<void> Function(Pet entity)? beforeSave;

  @override
  ConsumerState<PetRegisterForm> createState() => _PetRegisterFormState();
}

class _PetRegisterFormState extends ConsumerState<PetRegisterForm> implements FormStateInterface<Pet, PetVM> {
  @override
  final fk = GlobalKey<FormBuilderState>();

  @override
  bool loading = true;

  @override
  bool alreadyValidated = false;

  @override
  PetVM values = PetVM.empty();

  PetSex? _selectedGender;
  PetSpecie? _selectedSpecie;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final autovalidateMode = alreadyValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled;

    return FormBuilder(
      key: fk,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppThemeSpacing.extraSmallH,
          children: [
            Center(child: _PetAvatar(specie: _selectedSpecie)),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            FormBuilderTextField(
              name: 'name',
              decoration: InputDecoration(labelText: 'name'.tr()),
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderDropdown<PetSpecie>(
                    name: 'specie',
                    autovalidateMode: autovalidateMode,
                    decoration: InputDecoration(labelText: 'specie'.tr()),
                    items: PetSpecie.values
                        .map((specie) => DropdownMenuItem(
                              value: specie,
                              child: Text(specie.displayName),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSpecie = value;
                        fk.currentState?.fields['breed']?.didChange(null);
                      });
                    },
                  ),
                ),
                SizedBox(width: AppThemeSpacing.smallW),
                Expanded(
                  child: FormBuilderDropdown<PetBreed>(
                    name: 'breed',
                    autovalidateMode: autovalidateMode,
                    decoration: InputDecoration(labelText: 'breed'.tr()),
                    items: (_selectedSpecie == null
                            ? <PetBreed>[]
                            : PetBreed.values.where((b) => b.specie == _selectedSpecie).toList())
                        .map((breed) => DropdownMenuItem(
                              value: breed,
                              child: Text(breed.displayName),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _selectedGender = PetSex.male),
                    borderRadius: BorderRadius.all(AppThemeRadius.medium),
                    child: Ink(
                      padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                      decoration: BoxDecoration(
                        color: _selectedGender == PetSex.male ? colorScheme.primaryContainer : colorScheme.surface,
                        borderRadius: BorderRadius.all(AppThemeRadius.medium),
                        boxShadow: [AppThemeShadow.small],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(PetSex.male.displayName),
                          SizedBox(width: AppThemeSpacing.smallW),
                          Icon(
                            Icons.male,
                            size: AppThemeSpacing.smallH,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppThemeSpacing.smallW),
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _selectedGender = PetSex.female),
                    borderRadius: BorderRadius.all(AppThemeRadius.medium),
                    child: Ink(
                      padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                      decoration: BoxDecoration(
                        color: _selectedGender == PetSex.female ? colorScheme.primaryContainer : colorScheme.surface,
                        borderRadius: BorderRadius.all(AppThemeRadius.medium),
                        boxShadow: [AppThemeShadow.small],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(PetSex.female.displayName),
                          SizedBox(width: AppThemeSpacing.smallW),
                          Icon(
                            Icons.female,
                            size: AppThemeSpacing.smallH,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FormBuilderDateTimePicker(
              name: 'birthDate',
              locale: context.locale,
              format: DateFormat.yMd(context.locale.languageCode),
              inputType: InputType.date,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              decoration: InputDecoration(labelText: 'birthDate'.tr()),
            ),
            ElevatedButton(
              onPressed: () => HomeRoute().go(context),
              child: Text('continue'.tr()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PetVM extract() {
    return PetVM.empty();
  }

  @override
  PetVM populate(Pet entity) {
    return PetVM.empty();
  }

  @override
  Future<void> save({bool validateForm = true}) {
    throw UnimplementedError();
  }

  @override
  void checkTouched() {
    final currentValue = extract();
    final hasChanges = values != currentValue;
    if (ref.read(touchedProvider(petsModule)) != hasChanges) {
      setTouchedState(hasChanges);
    }
  }

  @override
  void setTouchedState(bool touched) {
    if (widget.setTouchedState != null) {
      widget.setTouchedState!(touched);
      return;
    }
    if (touched) {
      ref.read(touchedProvider(petsModule).notifier).touched();
    } else {
      ref.read(touchedProvider(petsModule).notifier).untouched();
    }
  }

  @override
  void onChanged() {
    if (!loading && fk.currentState?.isTouched == true) {
      checkTouched();
    }
  }

  @override
  bool validate({bool markAsLoading = false}) {
    throw UnimplementedError();
  }

  @override
  FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? fieldRef(String fieldName) =>
      fk.currentState?.fields[fieldName];

  @override
  T? getField<T>(String fieldName) => fieldRef(fieldName)?.value as T?;

  @override
  void setField(String fieldName, dynamic value) {
    fieldRef(fieldName)?.didChange(value);
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

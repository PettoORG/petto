import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/form/application/form_state_interface.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/domain/pet_vm.dart';
import 'package:petto/pets/shared/constant.dart';

/// Simple enum to track gender selection
enum Gender { male, female }

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

  /// Track the currently selected gender
  Gender? _selectedGender;

  /// Track the currently selected species
  PetSpecie? _selectedSpecie;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final autovalidateMode = alreadyValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled;

    return FormBuilder(
      key: fk,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        spacing: size.height * AppThemeSpacing.extraSmall,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: InputDecoration(
              label: Text('name'.tr()),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown<PetSpecie>(
                  name: 'specie',
                  autovalidateMode: autovalidateMode,
                  decoration: InputDecoration(labelText: 'specie'.tr()),
                  // Populate species using displayName
                  items: PetSpecie.values
                      .map((specie) => DropdownMenuItem(
                            value: specie,
                            child: Text(specie.displayName),
                          ))
                      .toList(),
                  onChanged: (PetSpecie? value) {
                    setState(() {
                      _selectedSpecie = value;
                      // Reset breed when species changes
                      fk.currentState?.fields['breed']?.didChange(null);
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FormBuilderDropdown<PetBreed>(
                  name: 'breed',
                  autovalidateMode: autovalidateMode,
                  decoration: InputDecoration(labelText: 'breed'.tr()),
                  // Filter breeds by selected species and use displayName
                  items: (_selectedSpecie == null
                          ? <PetBreed>[]
                          : PetBreed.values.where((breed) => breed.specie == _selectedSpecie).toList())
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
                  onTap: () {
                    setState(() {
                      _selectedGender = Gender.male;
                    });
                  },
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(size.height * AppThemeSpacing.tiny),
                    decoration: BoxDecoration(
                      color: _selectedGender == Gender.male ? colorScheme.primaryContainer : colorScheme.surface,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                      boxShadow: [AppThemeShadow.small],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('male'.tr()),
                        SizedBox(width: size.width * AppThemeSpacing.small),
                        Icon(
                          Icons.male,
                          size: size.height * AppThemeSpacing.small,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * AppThemeSpacing.small),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedGender = Gender.female;
                    });
                  },
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(size.height * AppThemeSpacing.tiny),
                    decoration: BoxDecoration(
                      color: _selectedGender == Gender.female ? colorScheme.primaryContainer : colorScheme.surface,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                      boxShadow: [AppThemeShadow.small],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('female'.tr()),
                        SizedBox(width: size.width * AppThemeSpacing.small),
                        Icon(
                          Icons.female,
                          size: size.height * AppThemeSpacing.small,
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

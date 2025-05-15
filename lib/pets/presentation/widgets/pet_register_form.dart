import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(
              label: Text('Nombre'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown<PetSpecie>(
                  name: 'Especie',
                  autovalidateMode: autovalidateMode,
                  decoration: const InputDecoration(labelText: 'Especie'),
                  items: <DropdownMenuItem<PetSpecie>>[],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FormBuilderDropdown<PetBreed>(
                  name: 'Raza',
                  autovalidateMode: autovalidateMode,
                  decoration: const InputDecoration(labelText: 'Raza'),
                  items: <DropdownMenuItem<PetBreed>>[],
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
                      // Store value in form
                      fk.currentState?.fields['gender']?.didChange('male');
                    });
                  },
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(size.height * AppThemeSpacing.tiny),
                    decoration: BoxDecoration(
                      color: _selectedGender == Gender.male ? colorScheme.primary : colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Macho'),
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
                      fk.currentState?.fields['gender']?.didChange('female');
                    });
                  },
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(size.height * AppThemeSpacing.tiny),
                    decoration: BoxDecoration(
                      color: _selectedGender == Gender.female ? colorScheme.primary : colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hembra'),
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
            decoration: const InputDecoration(labelText: 'Fecha de nacimiento'),
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

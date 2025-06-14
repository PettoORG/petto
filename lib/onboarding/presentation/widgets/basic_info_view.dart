import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_specie.dart';

class BasicInfoView extends StatelessWidget {
  const BasicInfoView({
    super.key,
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

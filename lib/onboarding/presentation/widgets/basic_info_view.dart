import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

              /// Pet name
              FormBuilderTextField(
                name: 'name',
                initialValue: initialName,
                decoration: InputDecoration(labelText: 'name'.tr()),
                validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              ),
              SizedBox(height: AppThemeSpacing.extraSmallH),

              /// Specie and Breed
              Row(
                children: [
                  Expanded(
                    child: FormBuilderDropdown<PetSpecie>(
                      name: 'specie',
                      decoration: InputDecoration(labelText: 'specie'.tr()),
                      initialValue: specie,
                      items:
                          PetSpecie.values.map((s) => DropdownMenuItem(value: s, child: Text(s.displayName))).toList(),
                      validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                      onChanged: onSpecieChanged,
                    ),
                  ),
                  SizedBox(width: AppThemeSpacing.smallW),
                  Expanded(
                    child: _BreedDropdownSearch(
                      key: ValueKey(specie),
                      breeds: availableBreeds,
                      initialBreed: selectedBreed,
                      onChanged: onBreedChanged,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppThemeSpacing.extraSmallH),

              /// Sex selector
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

/// Breed dropdown using dropdown_button2 with search support
class _BreedDropdownSearch extends StatefulWidget {
  const _BreedDropdownSearch({
    super.key,
    required this.breeds,
    required this.initialBreed,
    required this.onChanged,
  });

  final List<PetBreed> breeds;
  final PetBreed? initialBreed;
  final ValueChanged<PetBreed?> onChanged;

  @override
  State<_BreedDropdownSearch> createState() => _BreedDropdownSearchState();
}

class _BreedDropdownSearchState extends State<_BreedDropdownSearch> {
  late PetBreed? _selectedBreed;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedBreed = widget.initialBreed;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<PetBreed>(
        isExpanded: true,
        hint: Text(
          'breed'.tr(),
          style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
        ),
        items: widget.breeds
            .map((b) => DropdownMenuItem(
                  value: b,
                  child: Text(b.displayName, style: const TextStyle(fontSize: 14)),
                ))
            .toList(),
        value: _selectedBreed,
        onChanged: (value) {
          setState(() {
            _selectedBreed = value;
          });
          widget.onChanged(value);
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 44,
          width: double.infinity,
        ),
        dropdownStyleData: const DropdownStyleData(maxHeight: 240),
        menuItemStyleData: const MenuItemStyleData(height: 44),
        dropdownSearchData: DropdownSearchData(
          searchController: _searchController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                hintText: 'Search breed...'.tr(),
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            final breed = item.value;
            if (breed == null) return false;
            return breed.displayName.toLowerCase().contains(searchValue.toLowerCase());
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) _searchController.clear();
        },
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

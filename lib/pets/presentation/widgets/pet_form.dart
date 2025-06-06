import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/form/application/form_state_interface.dart';
import 'package:petto/core/form/application/id_provider.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/pets/app/pet_notifier.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/domain/pet_vm.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/shared/constant.dart';

class PetForm extends StatefulHookConsumerWidget {
  const PetForm({
    super.key,
    required this.id,
    this.basic = false,
    this.setTouchedState,
    this.beforeSave,
    this.onBreedChanged,
  });

  /// Unique identifier for the Pet.
  final String id;

  /// When `true`, only renders the minimal fields used during registration.
  final bool basic;

  /// Sets the touched state from parent.
  final void Function(bool touched)? setTouchedState;

  /// Runs before saving.
  final Future<void> Function(Pet entity)? beforeSave;

  /// Notifies whenever the breed changes (including resets to null).
  final Function(PetBreed? breed)? onBreedChanged;

  @override
  ConsumerState<PetForm> createState() => _PetFormState();
}

class _PetFormState extends ConsumerState<PetForm> implements FormStateInterface<Pet, PetVM> {
  @override
  final fk = GlobalKey<FormBuilderState>();

  @override
  bool loading = true;

  @override
  bool alreadyValidated = false;

  @override
  PetVM values = PetVM.empty();

  PetSex? _selectedPetSex;
  PetSpecie? _selectedSpecie;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(idProvider(petsModule).notifier).id = widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final autovalidateMode = alreadyValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled;

    ref.listen<BaseEntityState<Pet>>(
      petNotifierProvider,
      (previous, next) {
        if (next is Data<Pet>) {
          final entity = next.entity;
          setState(() {
            values = populate(entity);
            if (loading) {
              setTouchedState(false);
              loading = false;
              alreadyValidated = false;
            }
          });
          return;
        } else if (next is FailureState<Pet>) {
          setState(() => loading = false);
          showCustomFlash(
            context,
            next.failure.message ?? 'error.unexpectedError'.tr(),
          );
        }
      },
    );

    final isTouched = ref.watch(touchedProvider(petsModule));

    return FormBuilder(
      key: fk,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppThemeSpacing.extraSmallH,
        children: [
          FormBuilderTextField(
            name: 'name',
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: 'name'.tr()),
            autovalidateMode: autovalidateMode,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown<PetSpecie>(
                  name: 'specie',
                  autovalidateMode: autovalidateMode,
                  decoration: InputDecoration(labelText: 'specie'.tr()),
                  items: PetSpecie.values
                      .map(
                        (specie) => DropdownMenuItem(
                          value: specie,
                          child: Text(specie.displayName),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSpecie = value;
                      fk.currentState?.fields['breed']?.didChange(null);
                      widget.onBreedChanged?.call(null);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                  ]),
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
                      .map(
                        (breed) => DropdownMenuItem(
                          value: breed,
                          child: Text(breed.displayName),
                        ),
                      )
                      .toList(),
                  onChanged: widget.onBreedChanged,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                  ]),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => _selectedPetSex = PetSex.male);
                    onChanged();
                  },
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                    decoration: BoxDecoration(
                      color: _selectedPetSex == PetSex.male ? colorScheme.primaryContainer : colorScheme.surface,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                      boxShadow: [AppThemeShadow.small],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(PetSex.male.displayName),
                        SizedBox(width: AppThemeSpacing.smallW),
                        Icon(Icons.male, size: AppThemeSpacing.smallH),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppThemeSpacing.smallW),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => _selectedPetSex = PetSex.female);
                    onChanged();
                  },
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                    decoration: BoxDecoration(
                      color: _selectedPetSex == PetSex.female ? colorScheme.primaryContainer : colorScheme.surface,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                      boxShadow: [AppThemeShadow.small],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(PetSex.female.displayName),
                        SizedBox(width: AppThemeSpacing.smallW),
                        Icon(Icons.female, size: AppThemeSpacing.smallH),
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
          keyboardType: TextInputType.datetime,
          format: DateFormat.yMd(context.locale.languageCode),
          inputType: InputType.date,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          decoration: InputDecoration(labelText: 'birthDate'.tr()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            FormBuilderValidators.dateTime(errorText: 'validators.invalidDate'),
          ]),
        ),
        if (!widget.basic) ...[
          FormBuilderTextField(
            name: 'color',
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'color'.tr()),
            autovalidateMode: autovalidateMode,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
          FormBuilderTextField(
            name: 'weight',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'weight'.tr()),
            autovalidateMode: autovalidateMode,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              FormBuilderValidators.numeric(),
            ]),
          ),
          FormBuilderDropdown<PetSize>(
            name: 'size',
            autovalidateMode: autovalidateMode,
            decoration: InputDecoration(labelText: 'size'.tr()),
            items: PetSize.values
                .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                .toList(),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
          FormBuilderDropdown<FoodType>(
            name: 'foodType',
            autovalidateMode: autovalidateMode,
            decoration: InputDecoration(labelText: 'foodType'.tr()),
            items: FoodType.values
                .map((f) => DropdownMenuItem(value: f, child: Text(f.displayName)))
                .toList(),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
          FormBuilderTextField(
            name: 'microchipNumber',
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'microchipNumber'.tr()),
            autovalidateMode: autovalidateMode,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
        ],
        ElevatedButton(
          onPressed: (loading || !isTouched) ? null : save,
          child: Text(widget.basic ? 'continue'.tr() : 'save'.tr()),
        ),
        ],
      ),
    );
  }

  @override
  PetVM extract() {
    final breed = getField<PetBreed>('breed') ?? values.breed;
    final files = ref.read(filesNotifierProvider(petsModule)).files;

    final bool hasUploads = files.any((f) => f.status == AppFileStatus.upload);
    final bool hasActiveFiles = files.any((f) => f.status != AppFileStatus.delete && f.status != AppFileStatus.deleted);
    final bool allDeleted = files.isNotEmpty && !hasActiveFiles;

    String? photoUrl;

    if (values.id == '0') {
      photoUrl = hasUploads ? null : breed.defaultImageUrl;
    } else {
      if (hasUploads) {
        photoUrl = null;
      } else if (allDeleted) {
        photoUrl = breed.defaultImageUrl;
      } else {
        photoUrl = values.photoUrl;
      }
    }

    final weightStr = getField<String>('weight');
    final parsedWeight = double.tryParse(weightStr ?? '') ?? values.weight;

    return PetVM(
      id: values.id,
      name: getField('name') ?? values.name,
      specie: getField('specie') ?? values.specie,
      breed: breed,
      sex: _selectedPetSex ?? values.sex,
      birthDate: getField('birthDate') ?? values.birthDate,
      color: getField('color') ?? values.color,
      weight: parsedWeight,
      foodType: getField('foodType') ?? values.foodType,
      microchipNumber: getField('microchipNumber') ?? values.microchipNumber,
      size: getField('size') ?? values.size,
      photoUrl: photoUrl,
    );
  }

  @override
  PetVM populate(Pet entity) {
    final vm = PetVM.fromEntity(entity);
    final isNewEntity = values.id == '0';

    if (loading || vm.name == getField('name')) {
      setField('name', vm.name);
    }

    if (!isNewEntity && (loading || vm.specie == getField('specie'))) {
      setField('specie', vm.specie);
    }

    if (!isNewEntity && (loading || vm.breed == getField('breed'))) {
      setField('breed', vm.breed);
      widget.onBreedChanged?.call(vm.breed);
    }

    if (!isNewEntity) {
      _selectedPetSex = vm.sex;
    }

    if (!isNewEntity && (loading || vm.birthDate == getField('birthDate'))) {
      setField('birthDate', vm.birthDate);
    }

    if (loading || vm.color == getField('color')) {
      setField('color', vm.color);
    }

    if (loading || vm.weight.toString() == getField('weight')) {
      setField('weight', vm.weight.toString()); // ← conversión a String
    }

    if (loading || vm.foodType == getField('foodType')) {
      setField('foodType', vm.foodType);
    }

    if (loading || vm.microchipNumber == getField('microchipNumber')) {
      setField('microchipNumber', vm.microchipNumber);
    }

    if (loading || vm.size == getField('size')) {
      setField('size', vm.size);
    }

    return vm;
  }

  @override
  Future<void> save({bool validateForm = true}) async {
    final entity = ref.read(petNotifierProvider).entity;
    if (entity == null) return;

    if (validateForm) {
      if (!validate(markAsLoading: true)) return;
    }
    FocusScope.of(context).unfocus();

    final formData = extract();
    final upsertData = formData.toEntity(entity);

    if (widget.beforeSave != null) {
      await widget.beforeSave!(upsertData);
    }
    await ref.read(petNotifierProvider.notifier).save(upsertData);
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
    final isValid = fk.currentState!.validate();

    if (!isValid) {
      ref.read(petNotifierProvider.notifier).fail(
            Failure.validation(message: fk.currentState!.errors.values.first.toString()),
            recordError: false,
          );
    }

    setState(() {
      if (markAsLoading && isValid) loading = true;
      if (!alreadyValidated) alreadyValidated = true;
    });

    return isValid;
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

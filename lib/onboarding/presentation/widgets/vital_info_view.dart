import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_size.dart';

class VitalInfoView extends StatelessWidget {
  const VitalInfoView({
    super.key,
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
                      borderRadius: BorderRadius.all(AppThemeRadius.large),
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
                borderRadius: BorderRadius.all(AppThemeRadius.large),
                items: FoodType.values
                    .where((f) => f != FoodType.unselected)
                    .map((f) => DropdownMenuItem(value: f, child: Text(f.displayName)))
                    .toList(),
                validator: FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              ),
              SizedBox(height: AppThemeSpacing.extraSmallH),
              FormBuilderTextField(
                name: 'microchipNumber',
                decoration: InputDecoration(labelText: 'microchipNumberOptional'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/users/presentation/user_form.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/shared/constant.dart';
import 'package:petto/core/domain/failure.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/core/form/application/form_state_interface.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/users/application/user_notifier.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/domain/user_vm.dart';

class UserForm extends StatefulHookConsumerWidget {
  const UserForm({
    super.key,
    this.setTouchedState,
    this.beforeSave,
  });

  /// Callback to set "touched" state. It allows Parent Widget to run additional
  /// checks before setting "touched" state. If set, it will be used by
  /// "_setTouchedState" method.
  final void Function(bool touched)? setTouchedState;

  /// Callback to run additional logic before saving the form. It allows Parent
  /// Widget to run additional async processs before saving the form. [entity]
  /// contains de upsert data to be saved.
  final Future<void> Function(User entity)? beforeSave;

  @override
  ConsumerState<UserForm> createState() => _UserFormState();
}

class _UserFormState extends ConsumerState<UserForm> implements FormStateInterface<User, UserVM> {
  @override
  final fk = GlobalKey<FormBuilderState>();
  @override
  bool loading = true;
  @override
  bool alreadyValidated = false;
  @override
  UserVM values = UserVM.empty();

  @override
  Widget build(BuildContext context) {
    final autovalidateMode = alreadyValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled;

    ref.listen<BaseEntityState<User>>(
      userNotifierProvider,
      (previous, next) {
        if (next is Data<User>) {
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
        } else if (next is FailureState<User>) {
          setState(() => loading = false);
          showCustomFlash(
            context,
            next.failure.message ?? 'error.unexpectedError'.tr(),
          );
        }
      },
    );

    final isTouched = ref.watch(touchedProvider(usersModule));

    return FormBuilder(
      key: fk,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppThemeSpacing.extraSmallH,
        children: [
          FormBuilderTextField(
            name: 'displayName',
            autovalidateMode: autovalidateMode,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: 'name'.tr()),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
          FormBuilderTextField(
            name: 'email',
            autovalidateMode: autovalidateMode,
            readOnly: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'email'.tr()),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              FormBuilderValidators.email(errorText: 'validators.invalidEmail'.tr()),
            ]),
          ),
          ElevatedButton(
            onPressed: (loading || !isTouched) ? null : save,
            child: Text('save'.tr()),
          )
        ],
      ),
    );
  }

  @override
  UserVM extract() {
    return UserVM(
      id: values.id,
      displayName: getField('displayName') ?? values.displayName,
      email: getField('email') ?? values.email,
    );
  }

  @override
  UserVM populate(User entity) {
    final vm = UserVM.fromEntity(entity);
    if (loading || vm.displayName == getField('displayName')) {
      setField('displayName', vm.displayName);
    }
    if (loading || vm.email == getField('email')) {
      setField('email', vm.email);
    }
    return vm;
  }

  @override
  Future<void> save({bool validateForm = true}) async {
    final entity = ref.read(userNotifierProvider).entity;
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
    await ref.read(userNotifierProvider.notifier).save(upsertData);
  }

  @override
  void checkTouched() {
    final currentValue = extract();
    final hasChanges = values != currentValue;
    if (ref.read(touchedProvider(usersModule)) != hasChanges) {
      setTouchedState(hasChanges);
    }
  }

  @override
  void setTouchedState(bool touched) {
    if (widget.setTouchedState != null) {
      widget.setTouchedState!(touched);
    } else if (touched) {
      ref.read(touchedProvider(usersModule).notifier).touched();
    } else {
      ref.read(touchedProvider(usersModule).notifier).untouched();
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
      ref.read(userNotifierProvider.notifier).fail(
            Failure.validation(
              message: fk.currentState!.errors.values.first.toString(),
            ),
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

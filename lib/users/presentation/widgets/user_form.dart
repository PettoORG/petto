// lib/users/presentation/user_form.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/shared/constant.dart';
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

  final void Function(bool touched)? setTouchedState;
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
            decoration: InputDecoration(labelText: 'name'.tr()),
            validator: FormBuilderValidators.compose([]),
          ),
          FormBuilderTextField(
            name: 'email',
            autovalidateMode: autovalidateMode,
            readOnly: true,
            decoration: InputDecoration(labelText: 'email'.tr()),
          ),
          ElevatedButton(
            onPressed: (loading || isTouched)
                ? () async {
                    if (loading) return;
                    await save();
                  }
                : null,
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
    final state = ref.read(userNotifierProvider);
    final original = state is Data<User> ? state.entity : User.empty();

    if (validateForm) {
      if (!validate(markAsLoading: true)) return;
    }
    FocusScope.of(context).unfocus();

    final formData = extract();
    final upsertData = formData.toEntity(original);

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
    alreadyValidated = true;
    return fk.currentState?.saveAndValidate() ?? false;
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

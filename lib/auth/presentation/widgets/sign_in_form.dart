import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/router.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final fk = GlobalKey<FormBuilderState>();

  /// Bool that indicates if the form was already validated for the first time.
  /// Let the user see successful corrections after an invalid submit.
  bool _alreadyValidated = false;

  /// If password should be visible or not.
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    // true if loading or authenticated, false otherwise
    final loading = ref.watch(authNotifierProvider) is Loading || ref.watch(authNotifierProvider) is Authenticated;

    final autovalidateMode = _alreadyValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled;

    return FormBuilder(
      key: fk,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormBuilderTextField(
            name: 'email',
            autovalidateMode: autovalidateMode,
            decoration: InputDecoration(
              labelText: 'email'.tr(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
              FormBuilderValidators.email(errorText: 'validators.invalidEmail'.tr()),
            ]),
          ),
          SizedBox(height: AppThemeSpacing.extraSmallH),
          FormBuilderTextField(
            name: 'password',
            autovalidateMode: autovalidateMode,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'password'.tr(),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
            ]),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ForgotPasswordRoute().push(context);
              },
              child: Text('forgotPassword'.tr()),
            ),
          ),
          ElevatedButton(
            onPressed: !loading ? _signInWithEmailAndPassword : null,
            child: Text('signIn'.tr()),
          ),
        ],
      ),
    );
  }

  void _signInWithEmailAndPassword() {
    FocusScope.of(context).unfocus();
    if (validate()) {
      ref.read(authNotifierProvider.notifier).signInWithEmailAndPassword(
            getField('email'),
            getField('password'),
          );
    }
  }

  /// Validate the form.
  bool validate() {
    final isValid = fk.currentState!.validate();
    setState(() {
      if (!_alreadyValidated) _alreadyValidated = true;
    });

    return isValid;
  }

  // Returns the reference to a form field given the [fieldName].
  FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? fieldRef(String fieldName) =>
      fk.currentState?.fields[fieldName];

  // Returns the value of a form field given the [fieldName].
  dynamic getField<T>(String fieldName) => fieldRef(fieldName)?.value as T;
}

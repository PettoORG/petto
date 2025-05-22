import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/domain/auth_failure.dart';
import 'package:petto/core/presentation/widgets/flash.dart';

class ForgotPasswordScreen extends StatefulHookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final fk = GlobalKey<FormBuilderState>();

  /// Bool that indicates if the form was already validated for the first time.
  /// Let the user see successful corrections after an invalid submit.
  bool _alreadyValidated = false;

  /// Remaining seconds before resend is enabled
  int _secondsRemaining = 0;

  /// Timer for countdown
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    // true if loading or authenticated, false otherwise
    final loading = ref.watch(authNotifierProvider) is Loading || ref.watch(authNotifierProvider) is Authenticated;

    final autovalidateMode = _alreadyValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled;

    ref.listen<AuthState>(authNotifierProvider, (previous, next) async {
      switch (next) {
        case FailureState(failure: final failure):
          // Handle each failure case via nested switch
          switch (failure) {
            case Unexpected(message: final msg):
              showCustomFlash(context, msg ?? 'error.unexpectedError'.tr());
              break;
            case Network(message: final msg):
              showCustomFlash(context, msg ?? 'error.noInternetConnection'.tr());
              break;
            case TooManyRequests(message: final msg):
              showCustomFlash(context, msg ?? 'error.tooManyAttempts'.tr());
              break;
            case UserDisabled(message: final msg):
              showCustomFlash(context, msg ?? 'error.userDisabled'.tr());
              break;
            case InvalidEmailAndPasswordCombination(message: final msg):
              showCustomFlash(context, msg ?? 'error.incorrectEmailOrPassword'.tr());
              break;
            case InvalidRole(message: final msg):
              showCustomFlash(context, msg ?? 'error.invalidRole'.tr());
              break;
            case EmailInUse(message: final msg):
              showCustomFlash(context, msg ?? 'error.emailInUse'.tr());
              break;
            default:
              break;
          }
          break;
        default:
          break;
      }
    });

    final bool canResend = !loading && _secondsRemaining == 0;
    final String buttonText = _secondsRemaining > 0
        ? 'resendInValue'.plural(_secondsRemaining, args: [_secondsRemaining.toString()])
        : 'send'.tr();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.extraSmallH),
              child: FormBuilder(
                key: fk,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppThemeSpacing.extraSmallH,
                  children: [
                    Image.asset('assets/images/forgot-password-dog.png', height: .35.sh),
                    Text('forgotPassword'.tr(), style: textTheme.titleLarge),
                    Text('enterEmailToReset'.tr()),
                    FormBuilderTextField(
                      name: 'email',
                      autovalidateMode: autovalidateMode,
                      decoration: InputDecoration(hintText: 'email'.tr()),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: 'validators.fieldRequired'.tr()),
                        FormBuilderValidators.email(errorText: 'validators.invalidEmail'.tr()),
                      ]),
                    ),
                    ElevatedButton(
                      onPressed: canResend ? _sendPasswordResetEmail : null,
                      child: Text(buttonText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendPasswordResetEmail() {
    if (validate()) {
      ref.read(authNotifierProvider.notifier).sendPasswordResetEmail(getField('email'));
      _startResendTimer();
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

  /// Starts the 30 second countdown for resend
  void _startResendTimer() {
    setState(() {
      _secondsRemaining = 30;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  // Returns the reference to a form field given the [fieldName].
  FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? fieldRef(String fieldName) =>
      fk.currentState?.fields[fieldName];

  // Returns the value of a form field given the [fieldName].
  dynamic getField<T>(String fieldName) => fieldRef(fieldName)?.value as T;
}

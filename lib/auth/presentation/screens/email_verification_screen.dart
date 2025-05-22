import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/domain/auth_failure.dart';
import 'package:petto/core/presentation/widgets/flash.dart';

class EmailVerificationScreen extends StatefulHookConsumerWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends ConsumerState<EmailVerificationScreen> {
  Timer? _timer;
  int _start = 30;

  @override
  void initState() {
    super.initState();
    // Send verification email on entry and start countdown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authNotifierProvider.notifier).sendEmailVerification();
      _startTimer();
    });
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _start = 30;
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resendEmail() {
    ref.read(authNotifierProvider.notifier).sendEmailVerification();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/email-cat.png',
                      height: 0.35.sh,
                      width: .35.sh,
                    ),
                    SizedBox(height: AppThemeSpacing.extraSmallH),
                    Text('verifyEmailHeading'.tr(), style: textTheme.titleLarge),
                    SizedBox(height: AppThemeSpacing.extraTinyH),
                    Text('verifyEmailMessage'.tr()),
                    SizedBox(height: AppThemeSpacing.extraSmallH),
                    ElevatedButton(
                      onPressed: () async {
                        final isVerified = await ref.read(authNotifierProvider.notifier).checkEmailVerified();

                        if (!isVerified && context.mounted) {
                          showCustomFlash(context, 'emailNotVerifiedAlert'.tr(), type: FlashType.info);
                        }
                      },
                      child: Text('alreadyVerifiedEmail'.tr()),
                    ),
                    SizedBox(height: AppThemeSpacing.extraSmallH),
                    _start > 0
                        ? Text('Reenviar email en $_start...')
                        : TextButton(
                            onPressed: _resendEmail,
                            child: Text('Reenviar'),
                          ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).signOut();
                },
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

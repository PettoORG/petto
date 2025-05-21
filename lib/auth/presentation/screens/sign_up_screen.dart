import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/domain/auth_failure.dart';
import 'package:petto/auth/presentation/widgets/sign_up_form.dart';
import 'package:petto/core/presentation/widgets/flash.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // Full usable height inside SafeArea
    final double minHeight = 1.sh - ScreenUtil().statusBarHeight - ScreenUtil().bottomBarHeight;
    // 20% of screen height
    final double placeholderSize = 0.2.sh;

    ref.listen<AuthState>(authNotifierProvider, (previous, next) async {
      switch (next) {
        case FailureState(failure: final failure):
          // Handle each failure case via nested switch
          switch (failure) {
            case Unexpected(message: final msg):
              // Show unexpected error
              showCustomFlash(context, msg ?? 'error.unexpectedError'.tr());
              break;
            case Network(message: final msg):
              // Show no internet connection error
              showCustomFlash(context, msg ?? 'error.noInternetConnection'.tr());
              break;
            case TooManyRequests(message: final msg):
              // Show too many attempts error
              showCustomFlash(context, msg ?? 'error.tooManyAttempts'.tr());
              break;
            case UserDisabled(message: final msg):
              // Show user disabled error
              showCustomFlash(context, msg ?? 'error.userDisabled'.tr());
              break;
            case InvalidEmailAndPasswordCombination(message: final msg):
              // Show incorrect email/password error
              showCustomFlash(context, msg ?? 'error.incorrectEmailOrPassword'.tr());
              break;
            case InvalidRole(message: final msg):
              // Show invalid role error
              showCustomFlash(context, msg ?? 'error.invalidRole'.tr());
              break;
            case EmailInUse(message: final msg):
              showCustomFlash(context, msg ?? 'error.emailInUse'.tr());
              break;
            default:
              // No action for other AuthFailure cases
              break;
          }
          break;
        default:
          // No action on initial, loading, authenticated, or unauthenticated
          break;
      }
    });

    // true if loading or authenticated, false otherwise
    final loading = ref.watch(authNotifierProvider) is Loading || ref.watch(authNotifierProvider) is Authenticated;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: minHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppThemeSpacing.mediumH,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: AppThemeSpacing.extraSmallV,
                    children: [
                      const Spacer(),
                      Center(
                        child: SizedBox(
                          width: placeholderSize,
                          height: placeholderSize,
                          child: Placeholder(),
                        ),
                      ),
                      const Spacer(),
                      SignUpForm(),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              endIndent: AppThemeSpacing.extraSmallH,
                            ),
                          ),
                          Text('orRegisterWith'.tr()),
                          Expanded(
                            child: Divider(
                              indent: AppThemeSpacing.extraSmallH,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialButton(
                            asset: 'assets/svgs/google.svg',
                            onPressed: () {
                              ref.read(authNotifierProvider.notifier).signInWithGoogle();
                            },
                          ),
                          SizedBox(width: AppThemeSpacing.smallH),
                          _SocialButton(
                            asset: 'assets/svgs/apple.svg',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('alreadyHaveAccount'.tr()),
                          TextButton(
                            onPressed: () => const SignInRoute().go(context),
                            child: Text('signIn'.tr()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Show loading overlay when loading is true
          if (loading)
            Container(
              height: 1.sh,
              width: 1.sw,
              color: colorScheme.surfaceContainerHighest.withValues(alpha: .5),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String asset;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.asset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppThemeRadius.small),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppThemeSpacing.extraTinyV,
        ),
        child: SvgPicture.asset(
          asset,
          height: AppThemeSpacing.smallV,
        ),
      ),
    );
  }
}

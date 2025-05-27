import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/application/auth_state.dart';
import 'package:petto/auth/presentation/widgets/sign_up_form.dart';
import 'package:petto/auth/router.dart';
import 'package:petto/core/presentation/widgets/flash.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // Full usable height inside SafeArea
    final double minHeight = 1.sh - ScreenUtil().statusBarHeight;
    // 20% of screen height
    final double placeholderSize = 0.2.sh;

    ref.listen<AuthState>(authNotifierProvider, (previous, next) async {
      if (next is FailureState) {
        showCustomFlash(context, next.failure.message ?? 'error.unexpectedError'.tr());
      }
    });

    // true if loading or authenticated, false otherwise
    final loading = ref.watch(authNotifierProvider) is Loading || ref.watch(authNotifierProvider) is Authenticated;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: minHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppThemeSpacing.mediumW,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: AppThemeSpacing.extraSmallH,
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
                              endIndent: AppThemeSpacing.extraSmallW,
                            ),
                          ),
                          Text('orRegisterWith'.tr()),
                          Expanded(
                            child: Divider(
                              indent: AppThemeSpacing.extraSmallW,
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
                          SizedBox(width: AppThemeSpacing.smallW),
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
                      TermsAndPrivacyText(
                        onTermsTap: () {},
                        onPrivacyTap: () {},
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

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsAndPrivacyText({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Text.rich(
      TextSpan(
        style: textTheme.bodySmall?.copyWith(height: 1.5),
        children: [
          TextSpan(text: 'signUpTerms.agreementIntro'.tr()),
          TextSpan(
            text: 'signUpTerms.termsAndConditions'.tr(),
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          TextSpan(text: 'signUpTerms.and'.tr()),
          TextSpan(
            text: 'signUpTerms.privacyPolicy'.tr(),
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
          TextSpan(text: 'signUpTerms.agreementClosure'.tr()),
        ],
      ),
      textAlign: TextAlign.center,
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
          vertical: AppThemeSpacing.extraTinyH,
        ),
        child: SvgPicture.asset(
          asset,
          height: AppThemeSpacing.smallH,
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Full usable height inside SafeArea
    final double minHeight = 1.sh - ScreenUtil().statusBarHeight - ScreenUtil().bottomBarHeight;
    // 20% of screen height
    final double placeholderSize = 0.2.sh;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        labelText: 'email'.tr(),
                      ),
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(
                        labelText: 'password'.tr(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('register'.tr()),
                    ),
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
                          onPressed: () {},
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
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
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

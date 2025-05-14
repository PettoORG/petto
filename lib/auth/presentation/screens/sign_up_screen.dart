import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final minHeight = size.height - padding.top - padding.bottom;
    final placeholderSize = size.height * .2;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colors.primaryContainer,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * AppThemeSpacing.medium,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: size.height * AppThemeSpacing.extraSmall,
                  children: [
                    Spacer(),
                    Center(
                      child: SizedBox(
                        width: placeholderSize,
                        height: placeholderSize,
                        child: Placeholder(),
                      ),
                    ),
                    Spacer(),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(labelText: 'email'.tr()),
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(labelText: 'password'.tr()),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('register'.tr()),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            endIndent: size.width * AppThemeSpacing.extraSmall,
                          ),
                        ),
                        Text('orRegisterWith'.tr()),
                        Expanded(
                          child: Divider(
                            indent: size.width * AppThemeSpacing.extraSmall,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialButton(asset: 'assets/svgs/google.svg', onPressed: () {}),
                        SizedBox(width: size.width * AppThemeSpacing.small),
                        _SocialButton(asset: 'assets/svgs/apple.svg', onPressed: () {}),
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
                    SizedBox.shrink()
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
  const _SocialButton({required this.asset, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
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
        padding: EdgeInsets.symmetric(vertical: size.height * AppThemeSpacing.tiny),
        child: SvgPicture.asset(
          asset,
          height: size.height * AppThemeSpacing.small,
        ),
      ),
    );
  }
}

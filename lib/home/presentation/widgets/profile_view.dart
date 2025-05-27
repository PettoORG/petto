import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/users/router.dart';

class ProfileView extends HookConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final options = [
      _ProfileOption(title: 'Editar perfil', icon: Icons.edit, onTap: () => UserDetailsRoute().push(context)),
      _ProfileOption(title: 'Seguridad', icon: Icons.security, onTap: () => SecuritySettingsRoute().push(context)),
      _ProfileOption(title: 'Volverme Premium', icon: Icons.star, onTap: () {}),
      _ProfileOption(title: 'Ajustes', icon: Icons.settings, onTap: () {}),
      _ProfileOption(
        title: 'Centro de seguridad',
        icon: Icons.verified_user,
        onTap: () {},
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppThemeSpacing.extraSmallH,
          children: [
            const Center(child: _UserAvatar()),
            Container(
              height: 0.1.sh,
              color: colorScheme.surface,
            ),
            ...options.map((option) => InkWell(
                  onTap: option.onTap,
                  borderRadius: BorderRadius.all(AppThemeRadius.medium),
                  child: Ink(
                    padding: EdgeInsets.all(AppThemeSpacing.tinyH),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                      color: colorScheme.surface,
                      boxShadow: [AppThemeShadow.small],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(option.icon),
                        Text(option.title, style: textTheme.titleMedium),
                        Icon(Icons.arrow_forward_ios_rounded, color: colorScheme.primary),
                      ],
                    ),
                  ),
                )),
            TextButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 2;

    return Container(
      padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        shape: BoxShape.circle,
        boxShadow: [AppThemeShadow.small],
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: AppThemeSpacing.doubleXLH,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}

class _ProfileOption {
  const _ProfileOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
}

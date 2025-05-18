import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final options = [
      _ProfileOption(title: 'Editar perfil', icon: Icons.edit, onTap: () {}),
      _ProfileOption(title: 'Seguridad', icon: Icons.security, onTap: () {}),
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
        padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppThemeSpacing.extraSmallV,
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
                    padding: EdgeInsets.all(AppThemeSpacing.extraTinyV),
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
                        const Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                )),
            ElevatedButton(
              onPressed: () {},
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

    final double radius = AppThemeSpacing.extraLargeV;
    final double avatarSize = radius * 2;

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(AppThemeSpacing.extraTinyV),
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
                size: AppThemeSpacing.doubleXLV,
                color: colorScheme.primary,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(AppThemeSpacing.extraTinyV),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
                boxShadow: [AppThemeShadow.small],
              ),
              child: Icon(
                Icons.camera_alt,
                size: AppThemeSpacing.smallV,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ],
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

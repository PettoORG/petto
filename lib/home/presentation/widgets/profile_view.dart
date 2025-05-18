import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // Dynamic list of cards to display
    final List<_ProfileOption> options = [
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
        padding: EdgeInsets.symmetric(horizontal: size.width * AppThemeSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: size.height * AppThemeSpacing.extraSmall,
          children: [
            const Center(child: _UserAvatar()),
            Container(
              height: size.height * .1,
              color: colorScheme.surface,
            ),
            ...options.map(
              (option) => InkWell(
                onTap: option.onTap,
                borderRadius: const BorderRadius.all(AppThemeRadius.medium),
                child: Ink(
                  padding: EdgeInsets.all(size.height * AppThemeSpacing.extraTiny),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(AppThemeRadius.medium),
                    color: colorScheme.surface,
                    boxShadow: const [AppThemeShadow.small],
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
              ),
            ),
            // Existing logout button remains unchanged
            ElevatedButton(onPressed: () {}, child: const Text('Cerrar sesión')),
          ],
        ),
      ),
    );
  }
}

/// Avatar widget for the user profile.
class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double radius = size.height * AppThemeSpacing.extraLarge;
    final double avatarSize = radius * 2;

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Stack(
        children: [
          // Circular background container
          Container(
            padding: EdgeInsets.all(size.height * AppThemeSpacing.extraTiny),
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [AppThemeShadow.small],
            ),
            // Centered person icon
            child: Center(
              child: Icon(
                Icons.person,
                size: avatarSize * 0.6,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          // Camera overlay icon for future avatar editing
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(size.height * AppThemeSpacing.extraTiny),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                boxShadow: [AppThemeShadow.small],
              ),
              child: Icon(
                Icons.camera_alt,
                size: size.height * AppThemeSpacing.small,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Simple data holder for each profile option card.
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

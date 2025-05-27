import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final options = [
      _SecurityOption(
        title: 'Cambiar email',
        icon: Icons.email,
        onTap: () {},
      ),
      _SecurityOption(
        title: 'Cambiar contraseña',
        icon: Icons.lock,
        onTap: () {},
      ),
      _SecurityOption(
        title: 'Cuentas vinculadas',
        icon: Icons.link,
        onTap: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguridad'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppThemeSpacing.extraSmallH,
            children: [
              SizedBox.shrink(),
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
                onPressed: () {},
                child: const Text('Eliminar cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecurityOption {
  const _SecurityOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
}

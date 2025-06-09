import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/pets/router.dart';

class PetProfileScreen extends StatelessWidget {
  const PetProfileScreen({
    super.key,
    required this.petId,
  });

  final String petId;

  @override
  Widget build(BuildContext context) {
    final options = [
      _PetProfileOption(
        title: 'editPet',
        icon: Icons.edit,
        onTap: () => PetDetailsRoute(petId: petId).push(context),
      ),
      _PetProfileOption(
        title: 'sharePet',
        icon: Icons.share,
        onTap: () => PetShareRoute(petId: petId).push(context),
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('petProfile'.tr()),
            centerTitle: true,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: options
                    .map((o) => Padding(
                          padding: EdgeInsets.only(bottom: AppThemeSpacing.extraSmallH),
                          child: _OptionTile(option: o),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({required this.option});

  final _PetProfileOption option;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
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
            Text(option.title.tr(), style: textTheme.titleMedium),
            Icon(Icons.arrow_forward_ios_rounded, color: colorScheme.primary),
          ],
        ),
      ),
    );
  }
}

class _PetProfileOption {
  const _PetProfileOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
}

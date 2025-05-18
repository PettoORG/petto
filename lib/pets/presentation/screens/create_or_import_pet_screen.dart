import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class CreateOrImportPetScreen extends StatelessWidget {
  const CreateOrImportPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final placeholderSize = size.height * .35;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: _BackgroundPaws()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * AppThemeSpacing.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cat.png',
                  width: placeholderSize,
                  height: placeholderSize,
                ),
                SizedBox(height: size.width * AppThemeSpacing.medium),
                _PetCard(
                  onTap: () => PetRegisterRoute().push(context),
                  titleKey: 'createNewPet',
                  descriptionKey: 'createNewPetDescription',
                  size: size,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
                SizedBox(height: size.width * AppThemeSpacing.medium),
                _PetCard(
                  onTap: () {},
                  titleKey: 'addExistingPet',
                  descriptionKey: 'addExistingPetDescription',
                  size: size,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PetCard extends StatelessWidget {
  const _PetCard({
    required this.onTap,
    required this.titleKey,
    required this.descriptionKey,
    required this.size,
    required this.colorScheme,
    required this.textTheme,
  });

  final VoidCallback onTap;
  final String titleKey;
  final String descriptionKey;
  final Size size;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorScheme.surface,
      elevation: .3,
      borderRadius: const BorderRadius.all(AppThemeRadius.small),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(AppThemeRadius.small),
        child: Padding(
          padding: EdgeInsets.all(size.height * AppThemeSpacing.extraTiny),
          child: SizedBox(
            height: size.height * .1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(titleKey.tr(), style: textTheme.titleMedium),
                      Text(
                        descriptionKey.tr(),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width * AppThemeSpacing.extraSmall),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PawInfo {
  final double xFactor;
  final double yFactor;
  final double rotation;
  final double scale;
  const _PawInfo(this.xFactor, this.yFactor, this.rotation, this.scale);
}

class _BackgroundPaws extends StatelessWidget {
  const _BackgroundPaws();

  static const _paws = [
    _PawInfo(0.10, 0.10, math.pi * 0.15, 0.50),
    _PawInfo(0.80, 0.24, math.pi * 0.70, 0.45),
    _PawInfo(0.88, 0.05, math.pi * 0.05, 0.52),
    _PawInfo(0.15, 0.35, math.pi * 0.25, 0.60),
    _PawInfo(-0.11, 0.22, math.pi * 0.25, 0.60),
    _PawInfo(0.45, 0.53, math.pi * 0.85, 0.50),
    _PawInfo(-0.05, 0.60, math.pi * 0.35, 0.55),
    _PawInfo(0.38, 0.72, math.pi * 0.60, 0.42),
    _PawInfo(0.88, 0.61, math.pi * 0.20, 0.49),
    _PawInfo(0.08, 0.85, math.pi * 0.45, 0.53),
    _PawInfo(0.68, 0.87, math.pi * 0.30, 0.47),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IgnorePointer(
      child: Stack(
        children: _paws
            .map(
              (p) => Positioned(
                left: size.width * p.xFactor,
                top: size.height * p.yFactor,
                child: Transform.rotate(
                  angle: p.rotation,
                  child: Transform.scale(
                    scale: p.scale,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'assets/images/paw.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

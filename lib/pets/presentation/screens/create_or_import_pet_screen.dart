import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class CreateOrImportPetScreen extends StatelessWidget {
  const CreateOrImportPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final placeholderSize = 0.35.sh;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: _BackgroundPaws()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cat.png',
                  width: placeholderSize,
                  height: placeholderSize,
                ),
                SizedBox(height: AppThemeSpacing.mediumH),
                _PetCard(
                  onTap: () => PetRegisterRoute().push(context),
                  titleKey: 'createNewPet',
                  descriptionKey: 'createNewPetDescription',
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
                SizedBox(height: AppThemeSpacing.extraSmallH),
                _PetCard(
                  onTap: () {},
                  titleKey: 'addExistingPet',
                  descriptionKey: 'addExistingPetDescription',
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
    required this.colorScheme,
    required this.textTheme,
  });

  final VoidCallback onTap;
  final String titleKey;
  final String descriptionKey;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorScheme.surface,
      elevation: .3,
      borderRadius: BorderRadius.all(AppThemeRadius.small),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(AppThemeRadius.small),
        child: Padding(
          padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
          child: SizedBox(
            height: 0.1.sh,
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
                SizedBox(width: AppThemeSpacing.extraSmallW),
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
    return IgnorePointer(
      child: Stack(
        children: _paws.map((p) {
          return Positioned(
            left: p.xFactor.sw,
            top: p.yFactor.sh,
            child: Transform.rotate(
              angle: p.rotation,
              child: Transform.scale(
                scale: p.scale,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/paw.png',
                    width: 80.r,
                    height: 80.r,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

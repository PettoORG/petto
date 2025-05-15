import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class CreateOrImportPetScreen extends StatelessWidget {
  const CreateOrImportPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final placeholderSize = size.height * .35;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * AppThemeSpacing.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: size.width * AppThemeSpacing.medium,
        children: [
          SizedBox(
            width: placeholderSize,
            height: placeholderSize,
            child: Placeholder(),
          ),
          SizedBox(height: size.height * AppThemeSpacing.medium),
          InkWell(
            onTap: () => PetRegisterRoute().push(context),
            borderRadius: BorderRadius.all(AppThemeRadius.small),
            child: Ink(
              height: size.height * .12,
              padding: EdgeInsets.all(size.height * AppThemeSpacing.tiny),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.all(AppThemeRadius.small),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'createNewPet'.tr(),
                            style: textTheme.titleMedium,
                          ),
                          Text(
                            'createNewPetDescription'.tr(),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * AppThemeSpacing.extraSmall),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.all(AppThemeRadius.small),
            child: Ink(
              height: size.height * .12,
              padding: EdgeInsets.all(size.height * AppThemeSpacing.tiny),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.all(AppThemeRadius.small),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'addExistingPet'.tr(),
                            style: textTheme.titleMedium,
                          ),
                          Text(
                            'addExistingPetDescription'.tr(),
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * AppThemeSpacing.extraSmall),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

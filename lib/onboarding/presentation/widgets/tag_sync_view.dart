import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/home/router.dart';

class TagSyncView extends StatelessWidget {
  const TagSyncView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.smallW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                height: 0.2.sh,
                width: 0.2.sh,
                child: Placeholder(),
              ),
            ),
            SizedBox(height: AppThemeSpacing.smallH),
            Text(
                'Mantén a tu mascota segura con Petto Tag. Con tecnología NFC que te permite saber dónde está tu compañero peludo al momento.',
                textAlign: TextAlign.center),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            ElevatedButton(onPressed: () {}, child: Text('Consigue el tuyo'.tr())),
            Divider(height: AppThemeSpacing.largeH),
            Text('Ya tienes un Petto Tag?'.tr(),
                style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            ElevatedButton(onPressed: () {}, child: Text('Si, vincular ahora'.tr())),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            OutlinedButton(
                onPressed: () {
                  HomeRoute().go(context);
                },
                child: Text('No, continuar sin vincular'.tr())),
          ],
        ),
      ),
    );
  }
}

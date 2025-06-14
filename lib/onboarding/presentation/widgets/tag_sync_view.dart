import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class TagSyncView extends StatelessWidget {
  const TagSyncView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: AppThemeSpacing.ultraH, color: Theme.of(context).colorScheme.primary),
          SizedBox(height: AppThemeSpacing.smallH),
          Text('petCreatedSuccess'.tr(), style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

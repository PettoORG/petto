import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/reminders/presentation/widgets/reminder_form.dart';
import 'package:easy_localization/easy_localization.dart';

class ReminderDetailsScreen extends StatelessWidget {
  const ReminderDetailsScreen({
    super.key,
    required this.id,
    required this.files,
  });

  final String id;
  final List<AppFileViewModel> files;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('reminderDetails'.tr()),
            centerTitle: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
              child: ReminderForm(),
            ),
          )
        ],
      ),
    );
  }
}

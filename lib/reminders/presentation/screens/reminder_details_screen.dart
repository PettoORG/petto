import 'package:flutter/material.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/reminders/presentation/widgets/reminder_form.dart';

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
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Reminder Details'),
            centerTitle: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: ReminderForm(),
          )
        ],
      ),
    );
  }
}

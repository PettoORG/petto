import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class ReminderForm extends StatefulHookConsumerWidget {
  const ReminderForm({super.key});

  @override
  ConsumerState<ReminderForm> createState() => _ReminderFormState();
}

class _ReminderFormState extends ConsumerState<ReminderForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        spacing: AppThemeSpacing.extraSmallH,
        children: [
          SizedBox.shrink(),
          FormBuilderTextField(
            name: 'title',
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          FormBuilderTextField(
            name: 'description',
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
    );
  }
}

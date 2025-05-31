import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReminderForm extends StatefulHookConsumerWidget {
  const ReminderForm({super.key});

  @override
  ConsumerState<ReminderForm> createState() => _ReminderFormState();
}

class _ReminderFormState extends ConsumerState<ReminderForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

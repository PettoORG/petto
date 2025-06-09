import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RemindersListScreen extends StatelessWidget {
  const RemindersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('reminderListTitle'.tr()),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({
    super.key,
    required this.id,
    this.files = const [],
  });

  final String id;
  final List<AppFileViewModel> files;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PetDetailsScreen'),
      ),
    );
  }
}

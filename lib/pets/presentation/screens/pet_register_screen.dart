import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/pets/presentation/widgets/pet_register_form.dart';

class PetRegisterScreen extends StatelessWidget {
  const PetRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: PetRegisterForm(id: ''),
    );
  }
}

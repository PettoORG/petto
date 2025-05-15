import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/pets/presentation/widgets/pet_register_form.dart';

class PetRegisterScreen extends StatelessWidget {
  const PetRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * AppThemeSpacing.medium),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: size.height * AppThemeSpacing.extraSmall,
          children: [
            CircleAvatar(
              radius: size.height * AppThemeSpacing.extraLarge,
            ),
            PetRegisterForm(id: '')
          ],
        ),
      ),
    ));
  }
}

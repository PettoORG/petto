import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/pets/presentation/widgets/pet_register_form.dart';

class PetRegisterScreen extends StatelessWidget {
  const PetRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * AppThemeSpacing.medium),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: size.height * AppThemeSpacing.extraLarge,
                ),
                SizedBox(height: size.height * AppThemeSpacing.medium),
                PetRegisterForm(id: '')
              ],
            ),
          ),
        ));
  }
}

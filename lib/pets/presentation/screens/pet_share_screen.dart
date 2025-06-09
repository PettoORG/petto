import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class PetShareScreen extends StatelessWidget {
  const PetShareScreen({
    super.key,
    required this.petId,
  });

  final String petId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('sharePet'.tr()),
            centerTitle: true,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
              child: const SizedBox.shrink(),
            ),
          )
        ],
      ),
    );
  }
}

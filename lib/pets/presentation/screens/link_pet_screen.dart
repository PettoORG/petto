import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class LinkPetScreen extends StatelessWidget {
  const LinkPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final placeholderSize = 0.35.sh;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text('Vincular mascota'.tr()),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/cat-and-woman.png',
                        width: placeholderSize,
                        height: placeholderSize,
                      ),
                      SizedBox(height: AppThemeSpacing.smallH),
                      Text(
                        'Ingresa el código de vinculación que te compartieron para acceder a la información de una mascota ya registrada.',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppThemeSpacing.smallH),
                      FormBuilderTextField(name: 'code'),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(height: AppThemeSpacing.extraSmallH),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Vincular'.tr()),
                    ),
                  ),
                  SizedBox(height: AppThemeSpacing.smallH),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

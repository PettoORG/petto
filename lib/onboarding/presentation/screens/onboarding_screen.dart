import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:petto/app/router/app_router.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'onboardingWelcomeTitle'.tr(),
      'body': 'onboardingWelcomeBody'.tr(),
    },
    {
      'title': 'onboardingReminderTitle'.tr(),
      'body': 'onboardingReminderBody'.tr(),
    },
    {
      'title': 'onboardingMedicalHistoryTitle'.tr(),
      'body': 'onboardingMedicalHistoryBody'.tr(),
    },
    {
      'title': 'onboardingMultiPetTitle'.tr(),
      'body': 'onboardingMultiPetBody'.tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final placeholderSize = size.height * .35;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (context, i) {
                final page = _pages[i];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * AppThemeSpacing.medium,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: placeholderSize,
                        height: placeholderSize,
                        child: Placeholder(),
                      ),
                      SizedBox(height: size.height * AppThemeSpacing.large),
                      Text(
                        page['title']!,
                        style: textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * AppThemeSpacing.extraSmall),
                      Text(
                        page['body']!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (dot) {
              final active = dot == _current;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: active ? size.height * .04 : size.height * .01,
                height: size.height * .01,
                decoration: BoxDecoration(
                  color: active ? colors.primary : colors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * AppThemeSpacing.medium,
                vertical: size.height * AppThemeSpacing.extraSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_current == 0)
                    TextButton(
                      onPressed: () => SignInRoute().go(context),
                      child: Text('skip'.tr()),
                    )
                  else
                    TextButton(
                      onPressed: () => _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      child: Text('back'.tr()),
                    ),
                  if (_current < _pages.length - 1)
                    ElevatedButton(
                      onPressed: () => _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      child: Text('next'.tr()),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        SignInRoute().go(context);
                      },
                      child: Text('start'.tr()),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

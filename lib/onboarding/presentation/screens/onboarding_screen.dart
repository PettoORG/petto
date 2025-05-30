import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/router.dart';
import 'package:petto/preferences/application/app_preferences_notifier.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'onboardingWelcomeTitle'.tr(),
      'body': 'onboardingWelcomeBody'.tr(),
      'asset': 'assets/images/dog-and-men.png',
    },
    {
      'title': 'onboardingReminderTitle'.tr(),
      'body': 'onboardingReminderBody'.tr(),
      'asset': 'assets/images/cat-and-reminder.png',
    },
    {
      'title': 'onboardingMedicalHistoryTitle'.tr(),
      'body': 'onboardingMedicalHistoryBody'.tr(),
      'asset': 'assets/images/dog-and-veterinary.png',
    },
    {
      'title': 'onboardingMultiPetTitle'.tr(),
      'body': 'onboardingMultiPetBody'.tr(),
      'asset': 'assets/images/pet-family.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final placeholderSize = 0.35.sh;
    final prefs = ref.read(appPreferencesNotifierProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (context, i) {
                final page = _pages[i];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      page['asset']!,
                      height: placeholderSize,
                      width: placeholderSize,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppThemeSpacing.mediumW,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: AppThemeSpacing.largeH),
                          Text(
                            page['title']!,
                            style: textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppThemeSpacing.extraSmallH),
                          Text(
                            page['body']!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
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
                margin: EdgeInsets.symmetric(horizontal: 4.r),
                width: active ? 0.04.sh : 0.01.sh,
                height: 0.01.sh,
                decoration: BoxDecoration(
                  color: active ? colors.primary : colors.primaryContainer.withAlpha(179),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              );
            }),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppThemeSpacing.mediumW,
                vertical: AppThemeSpacing.extraSmallH,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_current == 0)
                    TextButton(
                      onPressed: () async {
                        await prefs.setHasSeenOnboarding(true);
                        if (context.mounted) {
                          SignInRoute().go(context);
                        }
                      },
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
                      onPressed: () async {
                        await prefs.setHasSeenOnboarding(true);
                        if (context.mounted) {
                          SignInRoute().go(context);
                        }
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

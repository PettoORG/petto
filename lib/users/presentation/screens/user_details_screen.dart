// lib/users/presentation/user_details_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/users/application/user_notifier.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/presentation/widgets/user_form.dart';

class UserDetailsScreen extends HookConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<BaseEntityState<User>>(
      userNotifierProvider,
      (previous, next) {
        if (next is FailureState<User>) {
          final msg = next.failure.message ?? 'error.unexpectedError'.tr();
          showCustomFlash(context, msg);
        }
      },
    );

    final state = ref.watch(userNotifierProvider);
    final isLoading = state is Loading;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                UserForm(),
              ],
            ),
          ),
          if (isLoading)
            Container(
              height: 1.sh,
              width: 1.sw,
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: .5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

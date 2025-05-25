// lib/users/presentation/user_details_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/shared/constant.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/form/application/base_entity_state.dart';
import 'package:petto/core/presentation/widgets/flash.dart';
import 'package:petto/users/application/user_notifier.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/presentation/widgets/user_form.dart';
import 'package:petto/users/shared/providers.dart';

class UserDetailsScreen extends StatefulHookConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  ConsumerState<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {
  /// Folder for files (nested in document).
  String filesFolder = 'files';

  /// Getter for "form" and "files" family.
  String get family => usersModule;

  /// Returns true if there are pending files to be uploaded or deleted.
  bool get hasFilePending => ref.read(filesNotifierProvider(family).notifier).hasFilesPending;

  /// Collection path for user documents.
  String get collectionPath => ref.read(userCollectionPathProvider);

  /// Builds the storage path for files.
  // String? get storagePath => _buildStoragePath();

  /// Builds the Firestore path for files.
  // String? get firestorePath => _buildFirestorePath();

  @override
  Widget build(BuildContext context) {
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
      appBar: AppBar(
        title: Text('Editar perfil'.tr()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppThemeSpacing.extraSmallH),
                _UserAvatar(),
                SizedBox(height: AppThemeSpacing.smallH),
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

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 2;

    return Center(
      child: SizedBox(
        width: avatarSize,
        height: avatarSize,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [AppThemeShadow.small],
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: AppThemeSpacing.doubleXLH,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [AppThemeShadow.small],
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: AppThemeSpacing.smallH,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

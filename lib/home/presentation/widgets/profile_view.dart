import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:petto/core/list/presentation/widgets/firestore_paginated_list_view.dart';
import 'package:petto/pets/shared/providers.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends HookConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final options = [
      _ProfileOption(title: 'Editar perfil', icon: Icons.edit, onTap: () => UserDetailsRoute().push(context)),
      _ProfileOption(title: 'Seguridad', icon: Icons.security, onTap: () => SecuritySettingsRoute().push(context)),
      _ProfileOption(title: 'Volverme Premium', icon: Icons.star, onTap: () {}),
      _ProfileOption(title: 'Ajustes', icon: Icons.settings, onTap: () {}),
      _ProfileOption(
        title: 'Centro de seguridad',
        icon: Icons.verified_user,
        onTap: () {},
      ),
    ];

    User user = ref.watch(userProvider).value!;

    final petsQuery = ref.watch(
      petsQueryProvider(family: 'petsByUserUid', clauses: [
        Where('createdBy', isEqualTo: user.uid),
        OrderBy('createdAt', descending: true),
      ]),
    );

    // Calculate diameter as 10% of screen height
    final double avatarDiameter = 0.1.sh;

    // Total height must accommodate avatar + spacing + name text height
    final double textLineHeight = textTheme.bodyMedium?.fontSize ?? 14;
    final double listHeight = avatarDiameter + .025.sh + textLineHeight;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserAvatar(),
            SizedBox(height: AppThemeSpacing.smallH),
            Text(
              'Tus mascotas',
              style: textTheme.titleMedium,
            ),
            SizedBox(height: AppThemeSpacing.extraTinyH),
            SizedBox(
              height: listHeight,
              child: FirestorePaginatedListView(
                query: petsQuery,
                loadingWidget: const CircularProgressIndicator(),
                errorWidget: const CircularProgressIndicator(),
                noResultsWidget: const CircularProgressIndicator(),
                scrollDirection: Axis.horizontal,
                // Build the "Add Pet" button as first item
                firstItemBuilder: (context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.tinyW),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: avatarDiameter,
                            height: avatarDiameter,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              shape: BoxShape.circle,
                              boxShadow: [AppThemeShadow.small],
                            ),
                            child: Icon(
                              Icons.add,
                              size: avatarDiameter * 0.6,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                        SizedBox(height: AppThemeSpacing.tinyH),
                        SizedBox(
                          width: avatarDiameter,
                          child: Text(
                            'Agregar',
                            style: textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },

                itemBuilder: (pet) {
                  final String? photoUrl = pet.photoUrl;
                  final boxShadow = AppThemeShadow.small;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.tinyW),
                    child: Column(
                      children: [
                        Container(
                          width: avatarDiameter,
                          height: avatarDiameter,
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            shape: BoxShape.circle,
                            boxShadow: [boxShadow],
                          ),
                          child: ClipOval(
                            child: photoUrl == null || photoUrl.isEmpty
                                // If no URL: show default pet icon
                                ? Center(
                                    child: Icon(
                                      Icons.pets,
                                      size: avatarDiameter * 0.6,
                                      color: colorScheme.primary,
                                    ),
                                  )
                                // If URL exists: load image with shimmer placeholder
                                : CachedNetworkImage(
                                    imageUrl: photoUrl,
                                    width: avatarDiameter,
                                    height: avatarDiameter,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: colorScheme.surface,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: avatarDiameter,
                                        height: avatarDiameter,
                                        decoration: BoxDecoration(
                                          color: colorScheme.surface,
                                          boxShadow: [boxShadow],
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Container(
                                      width: avatarDiameter,
                                      height: avatarDiameter,
                                      decoration: BoxDecoration(
                                        color: colorScheme.errorContainer,
                                        shape: BoxShape.circle,
                                        boxShadow: [boxShadow],
                                      ),
                                      child: Icon(
                                        Icons.error,
                                        color: colorScheme.error,
                                        size: avatarDiameter * 0.5,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: AppThemeSpacing.tinyH),
                        SizedBox(
                          width: avatarDiameter,
                          child: Text(
                            pet.name,
                            style: textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            Column(
              spacing: AppThemeSpacing.extraSmallH,
              children: [
                ...options.map((option) => InkWell(
                      onTap: option.onTap,
                      borderRadius: BorderRadius.all(AppThemeRadius.medium),
                      child: Ink(
                        padding: EdgeInsets.all(AppThemeSpacing.tinyH),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(AppThemeRadius.medium),
                          color: colorScheme.surface,
                          boxShadow: [AppThemeShadow.small],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(option.icon),
                            Text(option.title, style: textTheme.titleMedium),
                            Icon(Icons.arrow_forward_ios_rounded, color: colorScheme.primary),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            TextButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
              child: const Text('Cerrar sesión'),
            ),
            SizedBox(height: AppThemeSpacing.extraSmallH),
          ],
        ),
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

    return Container(
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
    );
  }
}

class _ProfileOption {
  const _ProfileOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
}

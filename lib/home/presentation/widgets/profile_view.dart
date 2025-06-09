import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:petto/pets/router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/auth/application/auth_notifier.dart';
import 'package:petto/auth/shared/providers.dart';
import 'package:petto/core/list/application/firestore_query_helper.dart';
import 'package:petto/core/list/presentation/widgets/firestore_paginated_list_view.dart';
import 'package:petto/pets/shared/providers.dart';
import 'package:petto/users/domain/user.dart';
import 'package:petto/users/router.dart';

/// Main profile page.
class ProfileView extends HookConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    // Options list.
    final options = [
      _ProfileOption(
        title: 'editProfile',
        icon: Icons.edit,
        onTap: () => UserDetailsRoute().push(context),
      ),
      _ProfileOption(
        title: 'security',
        icon: Icons.security,
        onTap: () => SecuritySettingsRoute().push(context),
      ),
      _ProfileOption(title: 'becomePremium', icon: Icons.star, onTap: () {}),
      _ProfileOption(title: 'settings', icon: Icons.settings, onTap: () {}),
      _ProfileOption(title: 'securityCenter', icon: Icons.verified_user, onTap: () {}),
    ];

    final double avatarDiameter = 0.1.sh;
    final double textLineHeight = textTheme.bodyMedium?.fontSize ?? 14;
    final double listHeight = avatarDiameter + .025.sh + textLineHeight;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.mediumW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _UserAvatar(),
            SizedBox(height: AppThemeSpacing.smallH),
            Text('myPets'.tr(), style: textTheme.titleMedium),
            SizedBox(height: AppThemeSpacing.extraTinyH),
            SizedBox(
              height: listHeight,
              child: _PetsCarousel(avatarDiameter: avatarDiameter),
            ),
            SizedBox(height: AppThemeSpacing.extraSmallH),
            ...options.map(
              (option) => Padding(
                padding: EdgeInsets.only(bottom: AppThemeSpacing.extraSmallH),
                child: _OptionTile(option: option),
              ),
            ),
            TextButton(
              onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
              child: Text('signOut'.tr()),
            ),
            SizedBox(height: AppThemeSpacing.extraSmallH),
          ],
        ),
      ),
    );
  }
}

/// Circular avatar placeholder.
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

/// Carousel displaying pet avatars plus the "add" card.
class _PetsCarousel extends HookConsumerWidget {
  const _PetsCarousel({
    required this.avatarDiameter,
  });

  final double avatarDiameter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtain current user to build the query as in original code.
    final User user = ref.watch(userProvider).value!;

    final petsQuery = ref.watch(
      petsQueryProvider(family: 'petsByUserUid', clauses: [
        Where('createdBy', isEqualTo: user.uid),
        OrderBy('createdAt', descending: true),
      ]),
    );

    return FirestorePaginatedListView(
      query: petsQuery,
      loadingWidget: const CircularProgressIndicator(),
      errorWidget: const CircularProgressIndicator(),
      noResultsWidget: const CircularProgressIndicator(),
      scrollDirection: Axis.horizontal,
      firstItemBuilder: (_) => _AddPetCard(
        avatarDiameter: avatarDiameter,
        onTap: () => PetDetailsRoute(petId: '0').push(context),
      ),
      itemBuilder: (pet) => _PetAvatarCard(
          pet: pet,
          avatarDiameter: avatarDiameter,
          onTap: () => PetProfileRoute(petId: pet.id).push(context)),
    );
  }
}

/// Card to add a new pet.
class _AddPetCard extends StatelessWidget {
  const _AddPetCard({
    required this.avatarDiameter,
    required this.onTap,
  });

  final double avatarDiameter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.tinyW),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(avatarDiameter),
            child: Ink(
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
              'add'.tr(),
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual pet avatar card.
class _PetAvatarCard extends StatelessWidget {
  const _PetAvatarCard({
    required this.pet,
    required this.avatarDiameter,
    this.onTap,
  });

  final dynamic pet;
  final double avatarDiameter;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final String? photoUrl = pet.photoUrl;
    final boxShadow = AppThemeShadow.small;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.tinyW),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(avatarDiameter),
            child: Ink(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [boxShadow],
              ),
              child: ClipOval(
                child: photoUrl == null || photoUrl.isEmpty
                    ? Center(
                        child: Icon(
                          Icons.pets,
                          size: avatarDiameter * 0.6,
                          color: colorScheme.primary,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: photoUrl,
                        width: avatarDiameter,
                        height: avatarDiameter,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Shimmer.fromColors(
                          baseColor: colorScheme.surface,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: avatarDiameter,
                            height: avatarDiameter,
                            color: colorScheme.surface,
                          ),
                        ),
                        errorWidget: (_, __, ___) => Container(
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
          ),
          SizedBox(height: AppThemeSpacing.tinyH),
          SizedBox(
            width: avatarDiameter,
            child: Text(
              pet.name,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Option tile widget.
class _OptionTile extends StatelessWidget {
  const _OptionTile({required this.option});

  final _ProfileOption option;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
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
            Text(option.title.tr(), style: textTheme.titleMedium),
            Icon(Icons.arrow_forward_ios_rounded, color: colorScheme.primary),
          ],
        ),
      ),
    );
  }
}

/// Model for option list.
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

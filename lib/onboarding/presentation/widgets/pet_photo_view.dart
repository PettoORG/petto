import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/constant/crop_options_constants.dart';
import 'package:petto/core/files/presentation/widgets/single_file.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:shimmer/shimmer.dart';

class PetPhotoView extends StatelessWidget {
  const PetPhotoView({
    super.key,
    required this.breed,
    required this.onFileChanged,
  });

  final PetBreed? breed;
  final void Function(List<AppFileViewModel>) onFileChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppThemeSpacing.smallH),
        Text('uploadPhotoTitle'.tr(), style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: AppThemeSpacing.extraTinyH),
        Text('uploadPhotoSubtitle'.tr(), textAlign: TextAlign.center),
        SizedBox(height: AppThemeSpacing.smallH),
        Center(
          child: SingleFile(
            family: petsModule,
            storagePath: null,
            firestorePath: null,
            cropOptions: circle300x300,
            onFileChanged: (file) => onFileChanged(file == null ? [] : [file]),
            showCancelAction: false,
            showDeleteAction: false,
            showRetryAction: false,
            unselectedFileWidget: (tap) => _PetAvatar(breed: breed, onImageTap: tap),
            borderRadius: BorderRadius.circular(AppThemeSpacing.ultraH),
            thumbnailHeight: .3.sh,
            thumbnailWidth: .3.sh,
          ),
        ),
      ],
    );
  }
}

class _PetAvatar extends StatelessWidget {
  const _PetAvatar({
    required this.breed,
    required this.onImageTap,
  });

  final PetBreed? breed;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    final double radius = AppThemeSpacing.extraLargeH;
    final double avatarSize = radius * 3;
    final String? networkUrl = breed?.defaultImageUrl;

    final Widget imageWidget = networkUrl != null
        ? CachedNetworkImage(
            imageUrl: networkUrl,
            fit: BoxFit.cover,
            width: avatarSize,
            height: avatarSize,
            placeholder: (_, __) => Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surface,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [AppThemeShadow.small],
                ),
              ),
            ),
            errorWidget: (_, __, ___) => Icon(Icons.image_not_supported, size: avatarSize * .5),
          )
        : Icon(Icons.pets_rounded, size: avatarSize * .5, color: Theme.of(context).colorScheme.primaryContainer);

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Stack(
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [AppThemeShadow.small],
            ),
            child: ClipOval(child: imageWidget),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onImageTap,
                borderRadius: BorderRadius.circular(AppThemeSpacing.smallH),
                child: Ink(
                  padding: EdgeInsets.all(AppThemeSpacing.extraTinyH),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [AppThemeShadow.small],
                  ),
                  child: Icon(Icons.camera_alt,
                      size: AppThemeSpacing.smallH, color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

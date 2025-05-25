import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';

part 'crop_options.freezed.dart';

/// Configuration for cropping image.
@freezed
sealed class CropOptions with _$CropOptions {
  const factory CropOptions({
    /// Maximum cropped image width.
    @Default(1) int maxWidth,

    /// Maximum cropped image height.
    @Default(1) int maxHeight,

    /// Controls the aspect ratio of crop bounds. If this values is set, the
    /// cropper is locked and user can't.
    required CropAspectRatio? aspectRatio,

    /// The format of result image, png or jpg (default is [ImageCompressFormat.jpg])
    @Default(ImageCompressFormat.jpg) ImageCompressFormat compressFormat,

    /// The value [0 - 100] to control the quality of image compression
    @Default(90) int compressQuality,

    /// Title for Crop Widget.
    required String title,

    /// Controls the style of crop bounds, it can be rectangle or circle style
    /// (default is [CropStyle.rectangle]).
    required CropStyle cropStyle,

    /// Desired aspect ratio is applied (from the list of given aspect ratio
    /// presets) when starting the cropper.
    @Default(CropAspectRatioPreset.square) CropAspectRatioPreset initAspectRatio,

    /// Set to true if you want to lock the aspect ratio of crop bounds with a
    /// fixed value (locked by default)
    @Default(true) bool lockAspectRatio,

    /// Set to true to hide the bottom controls (shown by default)
    @Default(false) bool hideBottomControls,
  }) = _CropOptions;
}

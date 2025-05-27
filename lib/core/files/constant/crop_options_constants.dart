import 'package:image_cropper/image_cropper.dart';
import 'package:petto/core/files/domain/crop_options.dart';

/// Crops an image to a 1080 x 1920 rectangle jpg.
const rectangle1080x1920 = CropOptions(
  maxWidth: 1080,
  maxHeight: 1920,
  aspectRatio: null,
  compressFormat: ImageCompressFormat.jpg,
  compressQuality: 90,
  title: 'Ajustar la imagen.',
  cropStyle: CropStyle.rectangle,
  initAspectRatio: CropAspectRatioPreset.original,
  lockAspectRatio: true,
  hideBottomControls: false,
);

/// Crops an image to a 600 x 600 square jpg.
const square800x800 = CropOptions(
  maxWidth: 800,
  maxHeight: 800,
  aspectRatio: null,
  compressFormat: ImageCompressFormat.jpg,
  compressQuality: 90,
  title: 'Ajustar la imagen.',
  cropStyle: CropStyle.rectangle,
  initAspectRatio: CropAspectRatioPreset.original,
  lockAspectRatio: true,
  hideBottomControls: false,
);

/// Crops an image to a 300 x 300 circle png.
const circle300x300 = CropOptions(
  maxWidth: 300,
  maxHeight: 300,
  aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  compressFormat: ImageCompressFormat.png,
  compressQuality: 90,
  title: 'Ajustar la imagen.',
  cropStyle: CropStyle.circle,
  initAspectRatio: CropAspectRatioPreset.original,
  lockAspectRatio: true,
  hideBottomControls: false,
);

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CropOptions {
  /// Maximum cropped image width.
  int get maxWidth;

  /// Maximum cropped image height.
  int get maxHeight;

  /// Controls the aspect ratio of crop bounds. If this values is set, the
  /// cropper is locked and user can't.
  CropAspectRatio? get aspectRatio;

  /// The format of result image, png or jpg (default is [ImageCompressFormat.jpg])
  ImageCompressFormat get compressFormat;

  /// The value [0 - 100] to control the quality of image compression
  int get compressQuality;

  /// Title for Crop Widget.
  String get title;

  /// Controls the style of crop bounds, it can be rectangle or circle style
  /// (default is [CropStyle.rectangle]).
  CropStyle get cropStyle;

  /// Desired aspect ratio is applied (from the list of given aspect ratio
  /// presets) when starting the cropper.
  CropAspectRatioPreset get initAspectRatio;

  /// Set to true if you want to lock the aspect ratio of crop bounds with a
  /// fixed value (locked by default)
  bool get lockAspectRatio;

  /// Set to true to hide the bottom controls (shown by default)
  bool get hideBottomControls;

  /// Create a copy of CropOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CropOptionsCopyWith<CropOptions> get copyWith =>
      _$CropOptionsCopyWithImpl<CropOptions>(this as CropOptions, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CropOptions &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.compressFormat, compressFormat) ||
                other.compressFormat == compressFormat) &&
            (identical(other.compressQuality, compressQuality) ||
                other.compressQuality == compressQuality) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cropStyle, cropStyle) ||
                other.cropStyle == cropStyle) &&
            (identical(other.initAspectRatio, initAspectRatio) ||
                other.initAspectRatio == initAspectRatio) &&
            (identical(other.lockAspectRatio, lockAspectRatio) ||
                other.lockAspectRatio == lockAspectRatio) &&
            (identical(other.hideBottomControls, hideBottomControls) ||
                other.hideBottomControls == hideBottomControls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      maxWidth,
      maxHeight,
      aspectRatio,
      compressFormat,
      compressQuality,
      title,
      cropStyle,
      initAspectRatio,
      lockAspectRatio,
      hideBottomControls);

  @override
  String toString() {
    return 'CropOptions(maxWidth: $maxWidth, maxHeight: $maxHeight, aspectRatio: $aspectRatio, compressFormat: $compressFormat, compressQuality: $compressQuality, title: $title, cropStyle: $cropStyle, initAspectRatio: $initAspectRatio, lockAspectRatio: $lockAspectRatio, hideBottomControls: $hideBottomControls)';
  }
}

/// @nodoc
abstract mixin class $CropOptionsCopyWith<$Res> {
  factory $CropOptionsCopyWith(
          CropOptions value, $Res Function(CropOptions) _then) =
      _$CropOptionsCopyWithImpl;
  @useResult
  $Res call(
      {int maxWidth,
      int maxHeight,
      CropAspectRatio? aspectRatio,
      ImageCompressFormat compressFormat,
      int compressQuality,
      String title,
      CropStyle cropStyle,
      CropAspectRatioPreset initAspectRatio,
      bool lockAspectRatio,
      bool hideBottomControls});
}

/// @nodoc
class _$CropOptionsCopyWithImpl<$Res> implements $CropOptionsCopyWith<$Res> {
  _$CropOptionsCopyWithImpl(this._self, this._then);

  final CropOptions _self;
  final $Res Function(CropOptions) _then;

  /// Create a copy of CropOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxWidth = null,
    Object? maxHeight = null,
    Object? aspectRatio = freezed,
    Object? compressFormat = null,
    Object? compressQuality = null,
    Object? title = null,
    Object? cropStyle = null,
    Object? initAspectRatio = null,
    Object? lockAspectRatio = null,
    Object? hideBottomControls = null,
  }) {
    return _then(_self.copyWith(
      maxWidth: null == maxWidth
          ? _self.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int,
      maxHeight: null == maxHeight
          ? _self.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: freezed == aspectRatio
          ? _self.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as CropAspectRatio?,
      compressFormat: null == compressFormat
          ? _self.compressFormat
          : compressFormat // ignore: cast_nullable_to_non_nullable
              as ImageCompressFormat,
      compressQuality: null == compressQuality
          ? _self.compressQuality
          : compressQuality // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cropStyle: null == cropStyle
          ? _self.cropStyle
          : cropStyle // ignore: cast_nullable_to_non_nullable
              as CropStyle,
      initAspectRatio: null == initAspectRatio
          ? _self.initAspectRatio
          : initAspectRatio // ignore: cast_nullable_to_non_nullable
              as CropAspectRatioPreset,
      lockAspectRatio: null == lockAspectRatio
          ? _self.lockAspectRatio
          : lockAspectRatio // ignore: cast_nullable_to_non_nullable
              as bool,
      hideBottomControls: null == hideBottomControls
          ? _self.hideBottomControls
          : hideBottomControls // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _CropOptions implements CropOptions {
  const _CropOptions(
      {this.maxWidth = 1,
      this.maxHeight = 1,
      required this.aspectRatio,
      this.compressFormat = ImageCompressFormat.jpg,
      this.compressQuality = 90,
      required this.title,
      required this.cropStyle,
      this.initAspectRatio = CropAspectRatioPreset.square,
      this.lockAspectRatio = true,
      this.hideBottomControls = false});

  /// Maximum cropped image width.
  @override
  @JsonKey()
  final int maxWidth;

  /// Maximum cropped image height.
  @override
  @JsonKey()
  final int maxHeight;

  /// Controls the aspect ratio of crop bounds. If this values is set, the
  /// cropper is locked and user can't.
  @override
  final CropAspectRatio? aspectRatio;

  /// The format of result image, png or jpg (default is [ImageCompressFormat.jpg])
  @override
  @JsonKey()
  final ImageCompressFormat compressFormat;

  /// The value [0 - 100] to control the quality of image compression
  @override
  @JsonKey()
  final int compressQuality;

  /// Title for Crop Widget.
  @override
  final String title;

  /// Controls the style of crop bounds, it can be rectangle or circle style
  /// (default is [CropStyle.rectangle]).
  @override
  final CropStyle cropStyle;

  /// Desired aspect ratio is applied (from the list of given aspect ratio
  /// presets) when starting the cropper.
  @override
  @JsonKey()
  final CropAspectRatioPreset initAspectRatio;

  /// Set to true if you want to lock the aspect ratio of crop bounds with a
  /// fixed value (locked by default)
  @override
  @JsonKey()
  final bool lockAspectRatio;

  /// Set to true to hide the bottom controls (shown by default)
  @override
  @JsonKey()
  final bool hideBottomControls;

  /// Create a copy of CropOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CropOptionsCopyWith<_CropOptions> get copyWith =>
      __$CropOptionsCopyWithImpl<_CropOptions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CropOptions &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.compressFormat, compressFormat) ||
                other.compressFormat == compressFormat) &&
            (identical(other.compressQuality, compressQuality) ||
                other.compressQuality == compressQuality) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cropStyle, cropStyle) ||
                other.cropStyle == cropStyle) &&
            (identical(other.initAspectRatio, initAspectRatio) ||
                other.initAspectRatio == initAspectRatio) &&
            (identical(other.lockAspectRatio, lockAspectRatio) ||
                other.lockAspectRatio == lockAspectRatio) &&
            (identical(other.hideBottomControls, hideBottomControls) ||
                other.hideBottomControls == hideBottomControls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      maxWidth,
      maxHeight,
      aspectRatio,
      compressFormat,
      compressQuality,
      title,
      cropStyle,
      initAspectRatio,
      lockAspectRatio,
      hideBottomControls);

  @override
  String toString() {
    return 'CropOptions(maxWidth: $maxWidth, maxHeight: $maxHeight, aspectRatio: $aspectRatio, compressFormat: $compressFormat, compressQuality: $compressQuality, title: $title, cropStyle: $cropStyle, initAspectRatio: $initAspectRatio, lockAspectRatio: $lockAspectRatio, hideBottomControls: $hideBottomControls)';
  }
}

/// @nodoc
abstract mixin class _$CropOptionsCopyWith<$Res>
    implements $CropOptionsCopyWith<$Res> {
  factory _$CropOptionsCopyWith(
          _CropOptions value, $Res Function(_CropOptions) _then) =
      __$CropOptionsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int maxWidth,
      int maxHeight,
      CropAspectRatio? aspectRatio,
      ImageCompressFormat compressFormat,
      int compressQuality,
      String title,
      CropStyle cropStyle,
      CropAspectRatioPreset initAspectRatio,
      bool lockAspectRatio,
      bool hideBottomControls});
}

/// @nodoc
class __$CropOptionsCopyWithImpl<$Res> implements _$CropOptionsCopyWith<$Res> {
  __$CropOptionsCopyWithImpl(this._self, this._then);

  final _CropOptions _self;
  final $Res Function(_CropOptions) _then;

  /// Create a copy of CropOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? maxWidth = null,
    Object? maxHeight = null,
    Object? aspectRatio = freezed,
    Object? compressFormat = null,
    Object? compressQuality = null,
    Object? title = null,
    Object? cropStyle = null,
    Object? initAspectRatio = null,
    Object? lockAspectRatio = null,
    Object? hideBottomControls = null,
  }) {
    return _then(_CropOptions(
      maxWidth: null == maxWidth
          ? _self.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int,
      maxHeight: null == maxHeight
          ? _self.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: freezed == aspectRatio
          ? _self.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as CropAspectRatio?,
      compressFormat: null == compressFormat
          ? _self.compressFormat
          : compressFormat // ignore: cast_nullable_to_non_nullable
              as ImageCompressFormat,
      compressQuality: null == compressQuality
          ? _self.compressQuality
          : compressQuality // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cropStyle: null == cropStyle
          ? _self.cropStyle
          : cropStyle // ignore: cast_nullable_to_non_nullable
              as CropStyle,
      initAspectRatio: null == initAspectRatio
          ? _self.initAspectRatio
          : initAspectRatio // ignore: cast_nullable_to_non_nullable
              as CropAspectRatioPreset,
      lockAspectRatio: null == lockAspectRatio
          ? _self.lockAspectRatio
          : lockAspectRatio // ignore: cast_nullable_to_non_nullable
              as bool,
      hideBottomControls: null == hideBottomControls
          ? _self.hideBottomControls
          : hideBottomControls // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

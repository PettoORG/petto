// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_file_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFileViewModel {
  /// AppFile object with all the information about the file.
  AppFile get file;

  /// Status of the file. It allows to determine what action should be performed
  /// on the file.
  AppFileStatus get status;

  /// Contains the file to be uploaded. Status should be "upload". It will be
  /// null for any other status.
  File? get pickedFile;

  /// Upload task progress from 0 - 100. Null if the File is not being uploaded.
  int? get progress;

  /// If File processing failed, this field will contain a Failure.
  Failure? get failure;

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFileViewModelCopyWith<AppFileViewModel> get copyWith =>
      _$AppFileViewModelCopyWithImpl<AppFileViewModel>(
          this as AppFileViewModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFileViewModel &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pickedFile, pickedFile) ||
                other.pickedFile == pickedFile) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, file, status, pickedFile, progress, failure);

  @override
  String toString() {
    return 'AppFileViewModel(file: $file, status: $status, pickedFile: $pickedFile, progress: $progress, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $AppFileViewModelCopyWith<$Res> {
  factory $AppFileViewModelCopyWith(
          AppFileViewModel value, $Res Function(AppFileViewModel) _then) =
      _$AppFileViewModelCopyWithImpl;
  @useResult
  $Res call(
      {AppFile file,
      AppFileStatus status,
      File? pickedFile,
      int? progress,
      Failure? failure});

  $AppFileCopyWith<$Res> get file;
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$AppFileViewModelCopyWithImpl<$Res>
    implements $AppFileViewModelCopyWith<$Res> {
  _$AppFileViewModelCopyWithImpl(this._self, this._then);

  final AppFileViewModel _self;
  final $Res Function(AppFileViewModel) _then;

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? status = null,
    Object? pickedFile = freezed,
    Object? progress = freezed,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as AppFile,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppFileStatus,
      pickedFile: freezed == pickedFile
          ? _self.pickedFile
          : pickedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      progress: freezed == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFileCopyWith<$Res> get file {
    return $AppFileCopyWith<$Res>(_self.file, (value) {
      return _then(_self.copyWith(file: value));
    });
  }

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_self.failure!, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _AppFileViewModel extends AppFileViewModel {
  const _AppFileViewModel(
      {required this.file,
      required this.status,
      required this.pickedFile,
      required this.progress,
      required this.failure})
      : super._();

  /// AppFile object with all the information about the file.
  @override
  final AppFile file;

  /// Status of the file. It allows to determine what action should be performed
  /// on the file.
  @override
  final AppFileStatus status;

  /// Contains the file to be uploaded. Status should be "upload". It will be
  /// null for any other status.
  @override
  final File? pickedFile;

  /// Upload task progress from 0 - 100. Null if the File is not being uploaded.
  @override
  final int? progress;

  /// If File processing failed, this field will contain a Failure.
  @override
  final Failure? failure;

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFileViewModelCopyWith<_AppFileViewModel> get copyWith =>
      __$AppFileViewModelCopyWithImpl<_AppFileViewModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFileViewModel &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pickedFile, pickedFile) ||
                other.pickedFile == pickedFile) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, file, status, pickedFile, progress, failure);

  @override
  String toString() {
    return 'AppFileViewModel(file: $file, status: $status, pickedFile: $pickedFile, progress: $progress, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$AppFileViewModelCopyWith<$Res>
    implements $AppFileViewModelCopyWith<$Res> {
  factory _$AppFileViewModelCopyWith(
          _AppFileViewModel value, $Res Function(_AppFileViewModel) _then) =
      __$AppFileViewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AppFile file,
      AppFileStatus status,
      File? pickedFile,
      int? progress,
      Failure? failure});

  @override
  $AppFileCopyWith<$Res> get file;
  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$AppFileViewModelCopyWithImpl<$Res>
    implements _$AppFileViewModelCopyWith<$Res> {
  __$AppFileViewModelCopyWithImpl(this._self, this._then);

  final _AppFileViewModel _self;
  final $Res Function(_AppFileViewModel) _then;

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? file = null,
    Object? status = null,
    Object? pickedFile = freezed,
    Object? progress = freezed,
    Object? failure = freezed,
  }) {
    return _then(_AppFileViewModel(
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as AppFile,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppFileStatus,
      pickedFile: freezed == pickedFile
          ? _self.pickedFile
          : pickedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      progress: freezed == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFileCopyWith<$Res> get file {
    return $AppFileCopyWith<$Res>(_self.file, (value) {
      return _then(_self.copyWith(file: value));
    });
  }

  /// Create a copy of AppFileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_self.failure!, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

// dart format on

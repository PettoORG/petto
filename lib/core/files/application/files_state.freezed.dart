// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilesState {
  List<AppFileViewModel> get files;
  Enum get status;

  /// Create a copy of FilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilesStateCopyWith<FilesState> get copyWith =>
      _$FilesStateCopyWithImpl<FilesState>(this as FilesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilesState &&
            const DeepCollectionEquality().equals(other.files, files) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(files), status);

  @override
  String toString() {
    return 'FilesState(files: $files, status: $status)';
  }
}

/// @nodoc
abstract mixin class $FilesStateCopyWith<$Res> {
  factory $FilesStateCopyWith(
          FilesState value, $Res Function(FilesState) _then) =
      _$FilesStateCopyWithImpl;
  @useResult
  $Res call({List<AppFileViewModel> files});
}

/// @nodoc
class _$FilesStateCopyWithImpl<$Res> implements $FilesStateCopyWith<$Res> {
  _$FilesStateCopyWithImpl(this._self, this._then);

  final FilesState _self;
  final $Res Function(FilesState) _then;

  /// Create a copy of FilesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
  }) {
    return _then(_self.copyWith(
      files: null == files
          ? _self.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<AppFileViewModel>,
    ));
  }
}

/// @nodoc

class Loading extends FilesState {
  const Loading(final List<AppFileViewModel> files, this.status)
      : _files = files,
        super._();

  final List<AppFileViewModel> _files;
  @override
  List<AppFileViewModel> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final LoadingStatus status;

  /// Create a copy of FilesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadingCopyWith<Loading> get copyWith =>
      _$LoadingCopyWithImpl<Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loading &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_files), status);

  @override
  String toString() {
    return 'FilesState.loading(files: $files, status: $status)';
  }
}

/// @nodoc
abstract mixin class $LoadingCopyWith<$Res>
    implements $FilesStateCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) _then) =
      _$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({List<AppFileViewModel> files, LoadingStatus status});
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading _self;
  final $Res Function(Loading) _then;

  /// Create a copy of FilesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? files = null,
    Object? status = null,
  }) {
    return _then(Loading(
      null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<AppFileViewModel>,
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class Loaded extends FilesState {
  const Loaded(final List<AppFileViewModel> files, this.status)
      : _files = files,
        super._();

  final List<AppFileViewModel> _files;
  @override
  List<AppFileViewModel> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final LoadedStatus status;

  /// Create a copy of FilesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_files), status);

  @override
  String toString() {
    return 'FilesState.loaded(files: $files, status: $status)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $FilesStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({List<AppFileViewModel> files, LoadedStatus status});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of FilesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? files = null,
    Object? status = null,
  }) {
    return _then(Loaded(
      null == files
          ? _self._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<AppFileViewModel>,
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadedStatus,
    ));
  }
}

// dart format on

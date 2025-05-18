// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppPreferencesState {
  AppPreferences get appPreferences;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppPreferencesStateCopyWith<AppPreferencesState> get copyWith =>
      _$AppPreferencesStateCopyWithImpl<AppPreferencesState>(
          this as AppPreferencesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppPreferencesState &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'AppPreferencesState(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class $AppPreferencesStateCopyWith<$Res> {
  factory $AppPreferencesStateCopyWith(
          AppPreferencesState value, $Res Function(AppPreferencesState) _then) =
      _$AppPreferencesStateCopyWithImpl;
  @useResult
  $Res call({AppPreferences appPreferences});

  $AppPreferencesCopyWith<$Res> get appPreferences;
}

/// @nodoc
class _$AppPreferencesStateCopyWithImpl<$Res>
    implements $AppPreferencesStateCopyWith<$Res> {
  _$AppPreferencesStateCopyWithImpl(this._self, this._then);

  final AppPreferencesState _self;
  final $Res Function(AppPreferencesState) _then;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_self.copyWith(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<$Res> get appPreferences {
    return $AppPreferencesCopyWith<$Res>(_self.appPreferences, (value) {
      return _then(_self.copyWith(appPreferences: value));
    });
  }
}

/// @nodoc

class _Loading extends AppPreferencesState {
  const _Loading(this.appPreferences) : super._();

  @override
  final AppPreferences appPreferences;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'AppPreferencesState.loading(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $AppPreferencesStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});

  @override
  $AppPreferencesCopyWith<$Res> get appPreferences;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_Loading(
      null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<$Res> get appPreferences {
    return $AppPreferencesCopyWith<$Res>(_self.appPreferences, (value) {
      return _then(_self.copyWith(appPreferences: value));
    });
  }
}

/// @nodoc

class _Data extends AppPreferencesState {
  const _Data(this.appPreferences) : super._();

  @override
  final AppPreferences appPreferences;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'AppPreferencesState.data(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res>
    implements $AppPreferencesStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});

  @override
  $AppPreferencesCopyWith<$Res> get appPreferences;
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_Data(
      null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<$Res> get appPreferences {
    return $AppPreferencesCopyWith<$Res>(_self.appPreferences, (value) {
      return _then(_self.copyWith(appPreferences: value));
    });
  }
}

/// @nodoc

class _Failure extends AppPreferencesState {
  const _Failure(this.appPreferences) : super._();

  @override
  final AppPreferences appPreferences;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'AppPreferencesState.failure(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $AppPreferencesStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});

  @override
  $AppPreferencesCopyWith<$Res> get appPreferences;
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_Failure(
      null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }

  /// Create a copy of AppPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<$Res> get appPreferences {
    return $AppPreferencesCopyWith<$Res>(_self.appPreferences, (value) {
      return _then(_self.copyWith(appPreferences: value));
    });
  }
}

// dart format on

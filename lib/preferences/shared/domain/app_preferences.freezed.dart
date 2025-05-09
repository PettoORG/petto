// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppPreferences {
  String? get isDarkTheme;
  String? get languageCode;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<AppPreferences> get copyWith =>
      _$AppPreferencesCopyWithImpl<AppPreferences>(
          this as AppPreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppPreferences &&
            (identical(other.isDarkTheme, isDarkTheme) ||
                other.isDarkTheme == isDarkTheme) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkTheme, languageCode);

  @override
  String toString() {
    return 'AppPreferences(isDarkTheme: $isDarkTheme, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $AppPreferencesCopyWith<$Res> {
  factory $AppPreferencesCopyWith(
          AppPreferences value, $Res Function(AppPreferences) _then) =
      _$AppPreferencesCopyWithImpl;
  @useResult
  $Res call({String? isDarkTheme, String? languageCode});
}

/// @nodoc
class _$AppPreferencesCopyWithImpl<$Res>
    implements $AppPreferencesCopyWith<$Res> {
  _$AppPreferencesCopyWithImpl(this._self, this._then);

  final AppPreferences _self;
  final $Res Function(AppPreferences) _then;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkTheme = freezed,
    Object? languageCode = freezed,
  }) {
    return _then(_self.copyWith(
      isDarkTheme: freezed == isDarkTheme
          ? _self.isDarkTheme
          : isDarkTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _AppPreferences extends AppPreferences {
  const _AppPreferences({required this.isDarkTheme, required this.languageCode})
      : super._();

  @override
  final String? isDarkTheme;
  @override
  final String? languageCode;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppPreferencesCopyWith<_AppPreferences> get copyWith =>
      __$AppPreferencesCopyWithImpl<_AppPreferences>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppPreferences &&
            (identical(other.isDarkTheme, isDarkTheme) ||
                other.isDarkTheme == isDarkTheme) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkTheme, languageCode);

  @override
  String toString() {
    return 'AppPreferences(isDarkTheme: $isDarkTheme, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$AppPreferencesCopyWith<$Res>
    implements $AppPreferencesCopyWith<$Res> {
  factory _$AppPreferencesCopyWith(
          _AppPreferences value, $Res Function(_AppPreferences) _then) =
      __$AppPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call({String? isDarkTheme, String? languageCode});
}

/// @nodoc
class __$AppPreferencesCopyWithImpl<$Res>
    implements _$AppPreferencesCopyWith<$Res> {
  __$AppPreferencesCopyWithImpl(this._self, this._then);

  final _AppPreferences _self;
  final $Res Function(_AppPreferences) _then;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDarkTheme = freezed,
    Object? languageCode = freezed,
  }) {
    return _then(_AppPreferences(
      isDarkTheme: freezed == isDarkTheme
          ? _self.isDarkTheme
          : isDarkTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

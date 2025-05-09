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
  /// Firebase Cloud Messaging (FCM) token for the instance of the application installed on the device.
  String? get fcmTokenId;

  /// The role of the user for whom the FCM token was generated.
  String? get fcmTokenRole;

  /// Unique identifier of the user for whom the FCM token was generated.
  String? get fcmTokenUid;

  /// Date and time when the FCM token was generated.
  DateTime? get fcmTokenTimestamp;

  /// Email that triggered an account linking error during sign-in.
  /// This field is used to store the email in cases where the authentication error is either
  /// 'email-already-in-use' or 'account-exists-with-different-credential'. Once the user
  /// has successfully authenticated, this information is checked and the user is directed to the
  /// account linking flow.
  String? get pendingAccountLinkingEmail;

  /// Recently searched marketplace queries.
  List<String>? get recentMarketplaceSearches;

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
            (identical(other.fcmTokenId, fcmTokenId) ||
                other.fcmTokenId == fcmTokenId) &&
            (identical(other.fcmTokenRole, fcmTokenRole) ||
                other.fcmTokenRole == fcmTokenRole) &&
            (identical(other.fcmTokenUid, fcmTokenUid) ||
                other.fcmTokenUid == fcmTokenUid) &&
            (identical(other.fcmTokenTimestamp, fcmTokenTimestamp) ||
                other.fcmTokenTimestamp == fcmTokenTimestamp) &&
            (identical(other.pendingAccountLinkingEmail,
                    pendingAccountLinkingEmail) ||
                other.pendingAccountLinkingEmail ==
                    pendingAccountLinkingEmail) &&
            const DeepCollectionEquality().equals(
                other.recentMarketplaceSearches, recentMarketplaceSearches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fcmTokenId,
      fcmTokenRole,
      fcmTokenUid,
      fcmTokenTimestamp,
      pendingAccountLinkingEmail,
      const DeepCollectionEquality().hash(recentMarketplaceSearches));

  @override
  String toString() {
    return 'AppPreferences(fcmTokenId: $fcmTokenId, fcmTokenRole: $fcmTokenRole, fcmTokenUid: $fcmTokenUid, fcmTokenTimestamp: $fcmTokenTimestamp, pendingAccountLinkingEmail: $pendingAccountLinkingEmail, recentMarketplaceSearches: $recentMarketplaceSearches)';
  }
}

/// @nodoc
abstract mixin class $AppPreferencesCopyWith<$Res> {
  factory $AppPreferencesCopyWith(
          AppPreferences value, $Res Function(AppPreferences) _then) =
      _$AppPreferencesCopyWithImpl;
  @useResult
  $Res call(
      {String? fcmTokenId,
      String? fcmTokenRole,
      String? fcmTokenUid,
      DateTime? fcmTokenTimestamp,
      String? pendingAccountLinkingEmail,
      List<String>? recentMarketplaceSearches});
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
    Object? fcmTokenId = freezed,
    Object? fcmTokenRole = freezed,
    Object? fcmTokenUid = freezed,
    Object? fcmTokenTimestamp = freezed,
    Object? pendingAccountLinkingEmail = freezed,
    Object? recentMarketplaceSearches = freezed,
  }) {
    return _then(_self.copyWith(
      fcmTokenId: freezed == fcmTokenId
          ? _self.fcmTokenId
          : fcmTokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokenRole: freezed == fcmTokenRole
          ? _self.fcmTokenRole
          : fcmTokenRole // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokenUid: freezed == fcmTokenUid
          ? _self.fcmTokenUid
          : fcmTokenUid // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokenTimestamp: freezed == fcmTokenTimestamp
          ? _self.fcmTokenTimestamp
          : fcmTokenTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pendingAccountLinkingEmail: freezed == pendingAccountLinkingEmail
          ? _self.pendingAccountLinkingEmail
          : pendingAccountLinkingEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      recentMarketplaceSearches: freezed == recentMarketplaceSearches
          ? _self.recentMarketplaceSearches
          : recentMarketplaceSearches // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _AppPreferences extends AppPreferences {
  const _AppPreferences(
      {required this.fcmTokenId,
      required this.fcmTokenRole,
      required this.fcmTokenUid,
      required this.fcmTokenTimestamp,
      required this.pendingAccountLinkingEmail,
      required final List<String>? recentMarketplaceSearches})
      : _recentMarketplaceSearches = recentMarketplaceSearches,
        super._();

  /// Firebase Cloud Messaging (FCM) token for the instance of the application installed on the device.
  @override
  final String? fcmTokenId;

  /// The role of the user for whom the FCM token was generated.
  @override
  final String? fcmTokenRole;

  /// Unique identifier of the user for whom the FCM token was generated.
  @override
  final String? fcmTokenUid;

  /// Date and time when the FCM token was generated.
  @override
  final DateTime? fcmTokenTimestamp;

  /// Email that triggered an account linking error during sign-in.
  /// This field is used to store the email in cases where the authentication error is either
  /// 'email-already-in-use' or 'account-exists-with-different-credential'. Once the user
  /// has successfully authenticated, this information is checked and the user is directed to the
  /// account linking flow.
  @override
  final String? pendingAccountLinkingEmail;

  /// Recently searched marketplace queries.
  final List<String>? _recentMarketplaceSearches;

  /// Recently searched marketplace queries.
  @override
  List<String>? get recentMarketplaceSearches {
    final value = _recentMarketplaceSearches;
    if (value == null) return null;
    if (_recentMarketplaceSearches is EqualUnmodifiableListView)
      return _recentMarketplaceSearches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            (identical(other.fcmTokenId, fcmTokenId) ||
                other.fcmTokenId == fcmTokenId) &&
            (identical(other.fcmTokenRole, fcmTokenRole) ||
                other.fcmTokenRole == fcmTokenRole) &&
            (identical(other.fcmTokenUid, fcmTokenUid) ||
                other.fcmTokenUid == fcmTokenUid) &&
            (identical(other.fcmTokenTimestamp, fcmTokenTimestamp) ||
                other.fcmTokenTimestamp == fcmTokenTimestamp) &&
            (identical(other.pendingAccountLinkingEmail,
                    pendingAccountLinkingEmail) ||
                other.pendingAccountLinkingEmail ==
                    pendingAccountLinkingEmail) &&
            const DeepCollectionEquality().equals(
                other._recentMarketplaceSearches, _recentMarketplaceSearches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fcmTokenId,
      fcmTokenRole,
      fcmTokenUid,
      fcmTokenTimestamp,
      pendingAccountLinkingEmail,
      const DeepCollectionEquality().hash(_recentMarketplaceSearches));

  @override
  String toString() {
    return 'AppPreferences(fcmTokenId: $fcmTokenId, fcmTokenRole: $fcmTokenRole, fcmTokenUid: $fcmTokenUid, fcmTokenTimestamp: $fcmTokenTimestamp, pendingAccountLinkingEmail: $pendingAccountLinkingEmail, recentMarketplaceSearches: $recentMarketplaceSearches)';
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
  $Res call(
      {String? fcmTokenId,
      String? fcmTokenRole,
      String? fcmTokenUid,
      DateTime? fcmTokenTimestamp,
      String? pendingAccountLinkingEmail,
      List<String>? recentMarketplaceSearches});
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
    Object? fcmTokenId = freezed,
    Object? fcmTokenRole = freezed,
    Object? fcmTokenUid = freezed,
    Object? fcmTokenTimestamp = freezed,
    Object? pendingAccountLinkingEmail = freezed,
    Object? recentMarketplaceSearches = freezed,
  }) {
    return _then(_AppPreferences(
      fcmTokenId: freezed == fcmTokenId
          ? _self.fcmTokenId
          : fcmTokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokenRole: freezed == fcmTokenRole
          ? _self.fcmTokenRole
          : fcmTokenRole // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokenUid: freezed == fcmTokenUid
          ? _self.fcmTokenUid
          : fcmTokenUid // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmTokenTimestamp: freezed == fcmTokenTimestamp
          ? _self.fcmTokenTimestamp
          : fcmTokenTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pendingAccountLinkingEmail: freezed == pendingAccountLinkingEmail
          ? _self.pendingAccountLinkingEmail
          : pendingAccountLinkingEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      recentMarketplaceSearches: freezed == recentMarketplaceSearches
          ? _self._recentMarketplaceSearches
          : recentMarketplaceSearches // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on

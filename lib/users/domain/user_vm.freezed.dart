// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserVM {
  String get id;
  String get displayName;
  String get email;

  /// Create a copy of UserVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserVMCopyWith<UserVM> get copyWith =>
      _$UserVMCopyWithImpl<UserVM>(this as UserVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, email);

  @override
  String toString() {
    return 'UserVM(id: $id, displayName: $displayName, email: $email)';
  }
}

/// @nodoc
abstract mixin class $UserVMCopyWith<$Res> {
  factory $UserVMCopyWith(UserVM value, $Res Function(UserVM) _then) =
      _$UserVMCopyWithImpl;
  @useResult
  $Res call({String id, String displayName, String email});
}

/// @nodoc
class _$UserVMCopyWithImpl<$Res> implements $UserVMCopyWith<$Res> {
  _$UserVMCopyWithImpl(this._self, this._then);

  final UserVM _self;
  final $Res Function(UserVM) _then;

  /// Create a copy of UserVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UserVM extends UserVM {
  const _UserVM(
      {required this.id, required this.displayName, required this.email})
      : super._();

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;

  /// Create a copy of UserVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserVMCopyWith<_UserVM> get copyWith =>
      __$UserVMCopyWithImpl<_UserVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, email);

  @override
  String toString() {
    return 'UserVM(id: $id, displayName: $displayName, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$UserVMCopyWith<$Res> implements $UserVMCopyWith<$Res> {
  factory _$UserVMCopyWith(_UserVM value, $Res Function(_UserVM) _then) =
      __$UserVMCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String displayName, String email});
}

/// @nodoc
class __$UserVMCopyWithImpl<$Res> implements _$UserVMCopyWith<$Res> {
  __$UserVMCopyWithImpl(this._self, this._then);

  final _UserVM _self;
  final $Res Function(_UserVM) _then;

  /// Create a copy of UserVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
  }) {
    return _then(_UserVM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

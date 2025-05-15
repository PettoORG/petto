// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pet {
  /// Document ID in the database.
  String get id;

  /// ID of the user who owns the pet.
  String get ownerId;

  /// Pet's name.
  String get name;

  /// Pet type (e.g. dog, cat, rabbit).
  PetSpecie get specie;

  /// Pet breed (e.g. Labrador, Persian).
  PetBreed get breed;

  /// Pet sex (e.g. male, female).
  String get sex;

  /// Pet birth date.
  DateTime get birthDate;

  /// Pet color or markings.
  String get color;

  /// Pet photo URL.
  String? get photoUrl;

  /// Pet's current weight in kilograms.
  double get weight;

  /// Pet's size category (small, medium, large).
  PetSize get size;

  /// Type of food the pet consumes (dry, wet, raw, etc).
  FoodType get foodType;

  /// Optional microchip number for pet identification.
  String get microchipNumber;

  /// Whether the pet is currently active (not deceased or given away).
  bool get active;

  /// Record creation date and time.
  DateTime? get createdAt;

  /// Last modification date and time.
  DateTime? get modifiedAt;

  /// UID of the user who created the record.
  String get createdBy;

  /// UID of the user who last modified the record.
  String get modifiedBy;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetCopyWith<Pet> get copyWith =>
      _$PetCopyWithImpl<Pet>(this as Pet, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specie, specie) || other.specie == specie) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.microchipNumber, microchipNumber) ||
                other.microchipNumber == microchipNumber) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      name,
      specie,
      breed,
      sex,
      birthDate,
      color,
      photoUrl,
      weight,
      size,
      foodType,
      microchipNumber,
      active,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'Pet(id: $id, ownerId: $ownerId, name: $name, specie: $specie, breed: $breed, sex: $sex, birthDate: $birthDate, color: $color, photoUrl: $photoUrl, weight: $weight, size: $size, foodType: $foodType, microchipNumber: $microchipNumber, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) _then) = _$PetCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      PetSpecie specie,
      PetBreed breed,
      String sex,
      DateTime birthDate,
      String color,
      String? photoUrl,
      double weight,
      PetSize size,
      FoodType foodType,
      String microchipNumber,
      bool active,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class _$PetCopyWithImpl<$Res> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._self, this._then);

  final Pet _self;
  final $Res Function(Pet) _then;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? specie = null,
    Object? breed = null,
    Object? sex = null,
    Object? birthDate = null,
    Object? color = null,
    Object? photoUrl = freezed,
    Object? weight = null,
    Object? size = null,
    Object? foodType = null,
    Object? microchipNumber = null,
    Object? active = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specie: null == specie
          ? _self.specie
          : specie // ignore: cast_nullable_to_non_nullable
              as PetSpecie,
      breed: null == breed
          ? _self.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as PetBreed,
      sex: null == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as PetSize,
      foodType: null == foodType
          ? _self.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      microchipNumber: null == microchipNumber
          ? _self.microchipNumber
          : microchipNumber // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedBy: null == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Pet extends Pet {
  const _Pet(
      {required this.id,
      required this.ownerId,
      required this.name,
      required this.specie,
      required this.breed,
      required this.sex,
      required this.birthDate,
      required this.color,
      required this.photoUrl,
      required this.weight,
      required this.size,
      required this.foodType,
      required this.microchipNumber,
      required this.active,
      required this.createdAt,
      required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy})
      : super._();

  /// Document ID in the database.
  @override
  final String id;

  /// ID of the user who owns the pet.
  @override
  final String ownerId;

  /// Pet's name.
  @override
  final String name;

  /// Pet type (e.g. dog, cat, rabbit).
  @override
  final PetSpecie specie;

  /// Pet breed (e.g. Labrador, Persian).
  @override
  final PetBreed breed;

  /// Pet sex (e.g. male, female).
  @override
  final String sex;

  /// Pet birth date.
  @override
  final DateTime birthDate;

  /// Pet color or markings.
  @override
  final String color;

  /// Pet photo URL.
  @override
  final String? photoUrl;

  /// Pet's current weight in kilograms.
  @override
  final double weight;

  /// Pet's size category (small, medium, large).
  @override
  final PetSize size;

  /// Type of food the pet consumes (dry, wet, raw, etc).
  @override
  final FoodType foodType;

  /// Optional microchip number for pet identification.
  @override
  final String microchipNumber;

  /// Whether the pet is currently active (not deceased or given away).
  @override
  final bool active;

  /// Record creation date and time.
  @override
  final DateTime? createdAt;

  /// Last modification date and time.
  @override
  final DateTime? modifiedAt;

  /// UID of the user who created the record.
  @override
  final String createdBy;

  /// UID of the user who last modified the record.
  @override
  final String modifiedBy;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetCopyWith<_Pet> get copyWith =>
      __$PetCopyWithImpl<_Pet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specie, specie) || other.specie == specie) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.microchipNumber, microchipNumber) ||
                other.microchipNumber == microchipNumber) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      name,
      specie,
      breed,
      sex,
      birthDate,
      color,
      photoUrl,
      weight,
      size,
      foodType,
      microchipNumber,
      active,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'Pet(id: $id, ownerId: $ownerId, name: $name, specie: $specie, breed: $breed, sex: $sex, birthDate: $birthDate, color: $color, photoUrl: $photoUrl, weight: $weight, size: $size, foodType: $foodType, microchipNumber: $microchipNumber, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$PetCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$PetCopyWith(_Pet value, $Res Function(_Pet) _then) =
      __$PetCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      PetSpecie specie,
      PetBreed breed,
      String sex,
      DateTime birthDate,
      String color,
      String? photoUrl,
      double weight,
      PetSize size,
      FoodType foodType,
      String microchipNumber,
      bool active,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class __$PetCopyWithImpl<$Res> implements _$PetCopyWith<$Res> {
  __$PetCopyWithImpl(this._self, this._then);

  final _Pet _self;
  final $Res Function(_Pet) _then;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? specie = null,
    Object? breed = null,
    Object? sex = null,
    Object? birthDate = null,
    Object? color = null,
    Object? photoUrl = freezed,
    Object? weight = null,
    Object? size = null,
    Object? foodType = null,
    Object? microchipNumber = null,
    Object? active = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
  }) {
    return _then(_Pet(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specie: null == specie
          ? _self.specie
          : specie // ignore: cast_nullable_to_non_nullable
              as PetSpecie,
      breed: null == breed
          ? _self.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as PetBreed,
      sex: null == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as PetSize,
      foodType: null == foodType
          ? _self.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      microchipNumber: null == microchipNumber
          ? _self.microchipNumber
          : microchipNumber // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedBy: null == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

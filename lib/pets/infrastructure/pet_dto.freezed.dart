// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetDTO {
  String get id;
  String get ownerId;
  String get name;
  PetSpecie get species;
  PetBreed get breed;
  PetSex get sex;
  @TimestampConverter()
  DateTime get birthDate;
  String get color;
  String? get photoUrl;
  double get weight;
  PetSize get size;
  FoodType get foodType;
  String get microchipNumber;
  bool get active;
  @TimestampConverter()
  DateTime? get createdAt;
  @TimestampConverter()
  DateTime? get modifiedAt;
  String get createdBy;
  String get modifiedBy;

  /// Create a copy of PetDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetDTOCopyWith<PetDTO> get copyWith =>
      _$PetDTOCopyWithImpl<PetDTO>(this as PetDTO, _$identity);

  /// Serializes this PetDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PetDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      name,
      species,
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
    return 'PetDTO(id: $id, ownerId: $ownerId, name: $name, species: $species, breed: $breed, sex: $sex, birthDate: $birthDate, color: $color, photoUrl: $photoUrl, weight: $weight, size: $size, foodType: $foodType, microchipNumber: $microchipNumber, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $PetDTOCopyWith<$Res> {
  factory $PetDTOCopyWith(PetDTO value, $Res Function(PetDTO) _then) =
      _$PetDTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      PetSpecie species,
      PetBreed breed,
      PetSex sex,
      @TimestampConverter() DateTime birthDate,
      String color,
      String? photoUrl,
      double weight,
      PetSize size,
      FoodType foodType,
      String microchipNumber,
      bool active,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class _$PetDTOCopyWithImpl<$Res> implements $PetDTOCopyWith<$Res> {
  _$PetDTOCopyWithImpl(this._self, this._then);

  final PetDTO _self;
  final $Res Function(PetDTO) _then;

  /// Create a copy of PetDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? species = null,
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
      species: null == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as PetSpecie,
      breed: null == breed
          ? _self.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as PetBreed,
      sex: null == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as PetSex,
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
@JsonSerializable()
class _PetDTO extends PetDTO {
  const _PetDTO(
      {this.id = '0',
      required this.ownerId,
      required this.name,
      required this.species,
      required this.breed,
      required this.sex,
      @TimestampConverter() required this.birthDate,
      required this.color,
      required this.photoUrl,
      required this.weight,
      required this.size,
      required this.foodType,
      required this.microchipNumber,
      required this.active,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy})
      : super._();
  factory _PetDTO.fromJson(Map<String, dynamic> json) => _$PetDTOFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final PetSpecie species;
  @override
  final PetBreed breed;
  @override
  final PetSex sex;
  @override
  @TimestampConverter()
  final DateTime birthDate;
  @override
  final String color;
  @override
  final String? photoUrl;
  @override
  final double weight;
  @override
  final PetSize size;
  @override
  final FoodType foodType;
  @override
  final String microchipNumber;
  @override
  final bool active;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? modifiedAt;
  @override
  final String createdBy;
  @override
  final String modifiedBy;

  /// Create a copy of PetDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetDTOCopyWith<_PetDTO> get copyWith =>
      __$PetDTOCopyWithImpl<_PetDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PetDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PetDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      name,
      species,
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
    return 'PetDTO(id: $id, ownerId: $ownerId, name: $name, species: $species, breed: $breed, sex: $sex, birthDate: $birthDate, color: $color, photoUrl: $photoUrl, weight: $weight, size: $size, foodType: $foodType, microchipNumber: $microchipNumber, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$PetDTOCopyWith<$Res> implements $PetDTOCopyWith<$Res> {
  factory _$PetDTOCopyWith(_PetDTO value, $Res Function(_PetDTO) _then) =
      __$PetDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      PetSpecie species,
      PetBreed breed,
      PetSex sex,
      @TimestampConverter() DateTime birthDate,
      String color,
      String? photoUrl,
      double weight,
      PetSize size,
      FoodType foodType,
      String microchipNumber,
      bool active,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class __$PetDTOCopyWithImpl<$Res> implements _$PetDTOCopyWith<$Res> {
  __$PetDTOCopyWithImpl(this._self, this._then);

  final _PetDTO _self;
  final $Res Function(_PetDTO) _then;

  /// Create a copy of PetDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? species = null,
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
    return _then(_PetDTO(
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
      species: null == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as PetSpecie,
      breed: null == breed
          ? _self.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as PetBreed,
      sex: null == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as PetSex,
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

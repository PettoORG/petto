// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetVM {
  String get id;
  String get name;
  PetSpecie get specie;
  PetBreed get breed;
  PetSex get sex;
  DateTime get birthDate;
  String get color;
  double get weight;
  PetSize get size;
  FoodType get foodType;
  String get microchipNumber;

  /// Create a copy of PetVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PetVMCopyWith<PetVM> get copyWith =>
      _$PetVMCopyWithImpl<PetVM>(this as PetVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PetVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specie, specie) || other.specie == specie) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.microchipNumber, microchipNumber) ||
                other.microchipNumber == microchipNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, specie, breed, sex,
      birthDate, color, weight, size, foodType, microchipNumber);

  @override
  String toString() {
    return 'PetVM(id: $id, name: $name, specie: $specie, breed: $breed, sex: $sex, birthDate: $birthDate, color: $color, weight: $weight, size: $size, foodType: $foodType, microchipNumber: $microchipNumber)';
  }
}

/// @nodoc
abstract mixin class $PetVMCopyWith<$Res> {
  factory $PetVMCopyWith(PetVM value, $Res Function(PetVM) _then) =
      _$PetVMCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      PetSpecie specie,
      PetBreed breed,
      PetSex sex,
      DateTime birthDate,
      String color,
      double weight,
      PetSize size,
      FoodType foodType,
      String microchipNumber});
}

/// @nodoc
class _$PetVMCopyWithImpl<$Res> implements $PetVMCopyWith<$Res> {
  _$PetVMCopyWithImpl(this._self, this._then);

  final PetVM _self;
  final $Res Function(PetVM) _then;

  /// Create a copy of PetVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specie = null,
    Object? breed = null,
    Object? sex = null,
    Object? birthDate = null,
    Object? color = null,
    Object? weight = null,
    Object? size = null,
    Object? foodType = null,
    Object? microchipNumber = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as PetSex,
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

class _PetVM extends PetVM {
  const _PetVM(
      {required this.id,
      required this.name,
      required this.specie,
      required this.breed,
      required this.sex,
      required this.birthDate,
      required this.color,
      required this.weight,
      required this.size,
      required this.foodType,
      required this.microchipNumber})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final PetSpecie specie;
  @override
  final PetBreed breed;
  @override
  final PetSex sex;
  @override
  final DateTime birthDate;
  @override
  final String color;
  @override
  final double weight;
  @override
  final PetSize size;
  @override
  final FoodType foodType;
  @override
  final String microchipNumber;

  /// Create a copy of PetVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PetVMCopyWith<_PetVM> get copyWith =>
      __$PetVMCopyWithImpl<_PetVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PetVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specie, specie) || other.specie == specie) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.microchipNumber, microchipNumber) ||
                other.microchipNumber == microchipNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, specie, breed, sex,
      birthDate, color, weight, size, foodType, microchipNumber);

  @override
  String toString() {
    return 'PetVM(id: $id, name: $name, specie: $specie, breed: $breed, sex: $sex, birthDate: $birthDate, color: $color, weight: $weight, size: $size, foodType: $foodType, microchipNumber: $microchipNumber)';
  }
}

/// @nodoc
abstract mixin class _$PetVMCopyWith<$Res> implements $PetVMCopyWith<$Res> {
  factory _$PetVMCopyWith(_PetVM value, $Res Function(_PetVM) _then) =
      __$PetVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      PetSpecie specie,
      PetBreed breed,
      PetSex sex,
      DateTime birthDate,
      String color,
      double weight,
      PetSize size,
      FoodType foodType,
      String microchipNumber});
}

/// @nodoc
class __$PetVMCopyWithImpl<$Res> implements _$PetVMCopyWith<$Res> {
  __$PetVMCopyWithImpl(this._self, this._then);

  final _PetVM _self;
  final $Res Function(_PetVM) _then;

  /// Create a copy of PetVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specie = null,
    Object? breed = null,
    Object? sex = null,
    Object? birthDate = null,
    Object? color = null,
    Object? weight = null,
    Object? size = null,
    Object? foodType = null,
    Object? microchipNumber = null,
  }) {
    return _then(_PetVM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as PetSex,
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

// dart format on

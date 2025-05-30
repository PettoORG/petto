import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/users/domain/user.dart';

part 'pet_dto.freezed.dart';
part 'pet_dto.g.dart';

@freezed
sealed class PetDTO with _$PetDTO implements BaseDTO<Pet> {
  const PetDTO._();

  const factory PetDTO({
    @Default('0') String id,
    required String ownerId,
    required String name,
    required PetSpecie species,
    required PetBreed breed,
    required PetSex sex,
    @TimestampConverter() required DateTime birthDate,
    required String color,
    required String? photoUrl,
    required double weight,
    required PetSize size,
    required FoodType foodType,
    required String microchipNumber,
    required bool active,
    @TimestampConverter() required DateTime? createdAt,
    @TimestampConverter() required DateTime? modifiedAt,
    required String createdBy,
    required String modifiedBy,
  }) = _PetDTO;

  @Implements<FromDocumentSnapshotFactory>()
  factory PetDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return PetDTO.fromJson(data).copyWith(id: doc.id);
  }

  @Implements<FromDomainFactory>()
  factory PetDTO.fromDomain(Pet pet) {
    return PetDTO(
      id: pet.id,
      ownerId: pet.ownerId,
      name: pet.name,
      species: pet.specie,
      breed: pet.breed,
      sex: pet.sex,
      birthDate: pet.birthDate,
      color: pet.color,
      photoUrl: pet.photoUrl,
      weight: pet.weight,
      size: pet.size,
      foodType: pet.foodType,
      microchipNumber: pet.microchipNumber,
      active: pet.active,
      createdAt: pet.createdAt,
      modifiedAt: pet.modifiedAt,
      createdBy: pet.createdBy,
      modifiedBy: pet.modifiedBy,
    );
  }

  @Implements<FromJsonFactory>()
  factory PetDTO.fromJson(Map<String, dynamic> json) => _$PetDTOFromJson(json);

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  @override
  Map<String, dynamic> toCreateDocument(User user) {
    final now = DateTime.now();
    return copyWith(
      ownerId: user.uid,
      createdAt: now,
      createdBy: user.uid,
      modifiedAt: now,
      modifiedBy: user.uid,
    ).toDocument();
  }

  @override
  Map<String, dynamic> toUpdateDocument(User user) {
    return copyWith(
      modifiedAt: DateTime.now(),
      modifiedBy: user.uid,
    ).toDocument();
  }

  @override
  Pet toDomain() {
    return Pet(
      id: id,
      ownerId: ownerId,
      name: name,
      specie: species,
      breed: breed,
      sex: sex,
      birthDate: birthDate,
      color: color,
      photoUrl: photoUrl,
      weight: weight,
      size: size,
      foodType: foodType,
      microchipNumber: microchipNumber,
      active: active,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
    );
  }
}

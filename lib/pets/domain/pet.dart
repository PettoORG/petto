import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/base_entity.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/domain/pet_specie.dart';

part 'pet.freezed.dart';

/// Main Pet model for the Pet Care App.
/// Stores relevant information for personalized care, tracking, and notifications.

@freezed
sealed class Pet with _$Pet implements BaseEntity {
  const Pet._();

  const factory Pet({
    /// Document ID in the database.
    required String id,

    /// ID of the user who owns the pet.
    required String ownerId,

    /// Pet's name.
    required String name,

    /// Pet type (e.g. dog, cat, rabbit).
    required PetSpecie specie,

    /// Pet breed (e.g. Labrador, Persian).
    required PetBreed breed,

    /// Pet sex (e.g. male, female).
    required PetSex sex,

    /// Pet birth date.
    required DateTime birthDate,

    /// Pet photo URL.
    required String? photoUrl,

    /// Pet's current weight in kilograms.
    required double weight,

    /// Pet's size category (small, medium, large).
    required PetSize size,

    /// Type of food the pet consumes (dry, wet, raw, etc).
    required FoodType foodType,

    /// Optional microchip number for pet identification.
    required String microchipNumber,

    /// Whether the pet is currently active (not deceased or given away).
    required bool active,

    /// Record creation date and time.
    required DateTime? createdAt,

    /// Last modification date and time.
    required DateTime? modifiedAt,

    /// UID of the user who created the record.
    required String createdBy,

    /// UID of the user who last modified the record.
    required String modifiedBy,
  }) = _Pet;

  factory Pet.empty() => Pet(
        id: '0',
        ownerId: '',
        name: '',
        specie: PetSpecie.other,
        breed: PetBreed.other,
        sex: PetSex.male,
        birthDate: DateTime.now(),
        photoUrl: null,
        weight: 0,
        size: PetSize.unselected,
        foodType: FoodType.unselected,
        microchipNumber: '',
        active: true,
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        createdBy: '',
        modifiedBy: '',
      );
}

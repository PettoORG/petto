import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/pet_size.dart';
import 'package:petto/pets/domain/pet_specie.dart';

part 'pet.freezed.dart';

/// Main Pet model for the Pet Care App.
/// Stores relevant information for personalized care, tracking, and notifications.

@freezed
sealed class Pet with _$Pet {
  const Pet._();

  const factory Pet({
    /// Document ID in the database.
    required String id,

    /// ID of the user who owns the pet.
    required String ownerId,

    /// Pet's name.
    required String name,

    /// Pet type (e.g. dog, cat, rabbit).
    required PetSpecie species,

    /// Pet breed (e.g. Labrador, Persian).
    required PetBreed breed,

    /// Pet sex (e.g. male, female).
    required String sex,

    /// Pet birth date.
    required DateTime birthDate,

    /// Pet color or markings.
    required String color,

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
        species: PetSpecie.other,
        breed: PetBreed.other,
        sex: '',
        birthDate: DateTime.now(),
        color: '',
        photoUrl: null,
        weight: 0.0,
        size: PetSize.small,
        foodType: FoodType.dry,
        microchipNumber: '',
        active: true,
        createdAt: DateTime.now(),
        modifiedAt: DateTime.now(),
        createdBy: '',
        modifiedBy: '',
      );
}

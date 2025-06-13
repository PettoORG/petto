import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/pets/domain/pet.dart';
import 'package:petto/pets/domain/pet_sex.dart';
import 'package:petto/pets/domain/pet_specie.dart';
import 'package:petto/pets/domain/pet_breed.dart';
import 'package:petto/pets/domain/food_type.dart';
import 'package:petto/pets/domain/pet_size.dart';

part 'pet_vm.freezed.dart';

/// ViewModel for the Pet entity.
/// This class is used to manage and manipulate Pet data in the UI layer.
@freezed
sealed class PetVM with _$PetVM {
  const PetVM._();

  /// Factory constructor for creating a PetVM instance.
  const factory PetVM({
    required String id,
    required String name,
    required PetSpecie specie,
    required PetBreed breed,
    required PetSex sex,
    required DateTime birthDate,
    required double weight,
    required PetSize size,
    String? photoUrl,
    required FoodType foodType,
    required String? microchipNumber,
  }) = _PetVM;

  /// Creates a PetVM from a Pet entity.
  factory PetVM.fromEntity(Pet entity) => PetVM(
        id: entity.id,
        name: entity.name,
        specie: entity.specie,
        breed: entity.breed,
        sex: entity.sex,
        birthDate: entity.birthDate,
        weight: entity.weight,
        size: entity.size,
        photoUrl: entity.photoUrl,
        foodType: entity.foodType,
        microchipNumber: entity.microchipNumber,
      );

  /// Creates an empty PetVM instance with default values.
  factory PetVM.empty() => PetVM(
        id: '0',
        name: '',
        specie: PetSpecie.other,
        breed: PetBreed.other,
        sex: PetSex.male,
        birthDate: DateTime.now(),
        weight: 0.0,
        size: PetSize.unselected,
        photoUrl: '',
        foodType: FoodType.unselected,
        microchipNumber: '',
      );

  /// Converts the PetVM back to a Pet entity.
  /// Constructs a new Pet object based on the VM fields.
  Pet toEntity(Pet entity) => entity.copyWith(
        id: id,
        name: name,
        specie: specie,
        breed: breed,
        sex: sex,
        birthDate: birthDate,
        weight: weight,
        size: size,
        photoUrl: photoUrl,
        foodType: foodType,
        microchipNumber: microchipNumber,
      );
}

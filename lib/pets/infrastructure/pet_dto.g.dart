// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetDTO _$PetDTOFromJson(Map<String, dynamic> json) => _PetDTO(
      id: json['id'] as String? ?? '0',
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      species: $enumDecode(_$PetSpecieEnumMap, json['species']),
      breed: $enumDecode(_$PetBreedEnumMap, json['breed']),
      sex: $enumDecode(_$PetSexEnumMap, json['sex']),
      birthDate:
          const TimestampConverter().fromJson(json['birthDate'] as Timestamp),
      color: json['color'] as String,
      photoUrl: json['photoUrl'] as String?,
      weight: (json['weight'] as num).toDouble(),
      size: $enumDecode(_$PetSizeEnumMap, json['size']),
      foodType: $enumDecode(_$FoodTypeEnumMap, json['foodType']),
      microchipNumber: json['microchipNumber'] as String,
      active: json['active'] as bool,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      modifiedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['modifiedAt'], const TimestampConverter().fromJson),
      createdBy: json['createdBy'] as String,
      modifiedBy: json['modifiedBy'] as String,
    );

Map<String, dynamic> _$PetDTOToJson(_PetDTO instance) => <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'species': _$PetSpecieEnumMap[instance.species]!,
      'breed': _$PetBreedEnumMap[instance.breed]!,
      'sex': _$PetSexEnumMap[instance.sex]!,
      'birthDate': const TimestampConverter().toJson(instance.birthDate),
      'color': instance.color,
      'photoUrl': instance.photoUrl,
      'weight': instance.weight,
      'size': _$PetSizeEnumMap[instance.size]!,
      'foodType': _$FoodTypeEnumMap[instance.foodType]!,
      'microchipNumber': instance.microchipNumber,
      'active': instance.active,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'modifiedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.modifiedAt, const TimestampConverter().toJson),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
    };

const _$PetSpecieEnumMap = {
  PetSpecie.dog: 'dog',
  PetSpecie.cat: 'cat',
  PetSpecie.other: 'other',
};

const _$PetBreedEnumMap = {
  PetBreed.mixedDog: 'mixedDog',
  PetBreed.labradorRetriever: 'labradorRetriever',
  PetBreed.frenchBulldog: 'frenchBulldog',
  PetBreed.chihuahua: 'chihuahua',
  PetBreed.goldenRetriever: 'goldenRetriever',
  PetBreed.shihTzu: 'shihTzu',
  PetBreed.poodle: 'poodle',
  PetBreed.germanShepherd: 'germanShepherd',
  PetBreed.dachshund: 'dachshund',
  PetBreed.rottweiler: 'rottweiler',
  PetBreed.beagle: 'beagle',
  PetBreed.yorkshireTerrier: 'yorkshireTerrier',
  PetBreed.pomeranian: 'pomeranian',
  PetBreed.boxer: 'boxer',
  PetBreed.pitBull: 'pitBull',
  PetBreed.otherDog: 'otherDog',
  PetBreed.mixedCat: 'mixedCat',
  PetBreed.maineCoon: 'maineCoon',
  PetBreed.ragdoll: 'ragdoll',
  PetBreed.siamese: 'siamese',
  PetBreed.persian: 'persian',
  PetBreed.bengal: 'bengal',
  PetBreed.sphynx: 'sphynx',
  PetBreed.britishShorthair: 'britishShorthair',
  PetBreed.scottishFold: 'scottishFold',
  PetBreed.americanShorthair: 'americanShorthair',
  PetBreed.siberian: 'siberian',
  PetBreed.exoticShorthair: 'exoticShorthair',
  PetBreed.russianBlue: 'russianBlue',
  PetBreed.norwegianForest: 'norwegianForest',
  PetBreed.devonRex: 'devonRex',
  PetBreed.otherCat: 'otherCat',
  PetBreed.other: 'other',
};

const _$PetSexEnumMap = {
  PetSex.male: 'male',
  PetSex.female: 'female',
};

const _$PetSizeEnumMap = {
  PetSize.small: 'small',
  PetSize.medium: 'medium',
  PetSize.large: 'large',
};

const _$FoodTypeEnumMap = {
  FoodType.dry: 'dry',
  FoodType.wet: 'wet',
  FoodType.raw: 'raw',
  FoodType.mixed: 'mixed',
  FoodType.special: 'special',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

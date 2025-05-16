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
      sex: json['sex'] as String,
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
      'sex': instance.sex,
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
  PetBreed.labradorRetriever: 'labradorRetriever',
  PetBreed.germanShepherd: 'germanShepherd',
  PetBreed.goldenRetriever: 'goldenRetriever',
  PetBreed.bulldog: 'bulldog',
  PetBreed.poodle: 'poodle',
  PetBreed.beagle: 'beagle',
  PetBreed.rottweiler: 'rottweiler',
  PetBreed.dachshund: 'dachshund',
  PetBreed.yorkshireTerrier: 'yorkshireTerrier',
  PetBreed.boxer: 'boxer',
  PetBreed.persian: 'persian',
  PetBreed.maineCoon: 'maineCoon',
  PetBreed.siamese: 'siamese',
  PetBreed.bengal: 'bengal',
  PetBreed.britishShorthair: 'britishShorthair',
  PetBreed.sphynx: 'sphynx',
  PetBreed.ragdoll: 'ragdoll',
  PetBreed.americanShorthair: 'americanShorthair',
  PetBreed.scottishFold: 'scottishFold',
  PetBreed.russianBlue: 'russianBlue',
  PetBreed.other: 'other',
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

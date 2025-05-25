// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppFileDTO _$AppFileDTOFromJson(Map<String, dynamic> json) => _AppFileDTO(
      id: json['id'] as String? ?? '0',
      name: json['name'] as String,
      bucket: json['bucket'] as String?,
      path: json['path'] as String,
      url: json['url'] as String?,
      thumbnail: json['thumbnail'] as String?,
      thumbnailPath: json['thumbnailPath'] as String,
      mime: json['mime'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      modifiedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['modifiedAt'], const TimestampConverter().fromJson),
      createdBy: json['createdBy'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
    );

Map<String, dynamic> _$AppFileDTOToJson(_AppFileDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bucket': instance.bucket,
      'path': instance.path,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'thumbnailPath': instance.thumbnailPath,
      'mime': instance.mime,
      'metadata': instance.metadata,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'modifiedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.modifiedAt, const TimestampConverter().toJson),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
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

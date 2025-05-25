// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_file_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFileDTO {
  String get id;
  String get name;
  String? get bucket;
  String get path;
  String? get url;
  String? get thumbnail;
  String get thumbnailPath;
  String get mime;
  Map<String, dynamic>? get metadata;
  @TimestampConverter()
  DateTime? get createdAt;
  @TimestampConverter()
  DateTime? get modifiedAt;
  String? get createdBy;
  String? get modifiedBy;

  /// Create a copy of AppFileDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFileDTOCopyWith<AppFileDTO> get copyWith =>
      _$AppFileDTOCopyWithImpl<AppFileDTO>(this as AppFileDTO, _$identity);

  /// Serializes this AppFileDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFileDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
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
      name,
      bucket,
      path,
      url,
      thumbnail,
      thumbnailPath,
      mime,
      const DeepCollectionEquality().hash(metadata),
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'AppFileDTO(id: $id, name: $name, bucket: $bucket, path: $path, url: $url, thumbnail: $thumbnail, thumbnailPath: $thumbnailPath, mime: $mime, metadata: $metadata, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $AppFileDTOCopyWith<$Res> {
  factory $AppFileDTOCopyWith(
          AppFileDTO value, $Res Function(AppFileDTO) _then) =
      _$AppFileDTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? bucket,
      String path,
      String? url,
      String? thumbnail,
      String thumbnailPath,
      String mime,
      Map<String, dynamic>? metadata,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String? createdBy,
      String? modifiedBy});
}

/// @nodoc
class _$AppFileDTOCopyWithImpl<$Res> implements $AppFileDTOCopyWith<$Res> {
  _$AppFileDTOCopyWithImpl(this._self, this._then);

  final AppFileDTO _self;
  final $Res Function(AppFileDTO) _then;

  /// Create a copy of AppFileDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bucket = freezed,
    Object? path = null,
    Object? url = freezed,
    Object? thumbnail = freezed,
    Object? thumbnailPath = null,
    Object? mime = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = freezed,
    Object? modifiedBy = freezed,
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
      bucket: freezed == bucket
          ? _self.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailPath: null == thumbnailPath
          ? _self.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _self.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppFileDTO extends AppFileDTO {
  const _AppFileDTO(
      {this.id = '0',
      required this.name,
      this.bucket,
      required this.path,
      this.url,
      this.thumbnail,
      required this.thumbnailPath,
      required this.mime,
      final Map<String, dynamic>? metadata,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.modifiedAt,
      this.createdBy,
      this.modifiedBy})
      : _metadata = metadata,
        super._();
  factory _AppFileDTO.fromJson(Map<String, dynamic> json) =>
      _$AppFileDTOFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String name;
  @override
  final String? bucket;
  @override
  final String path;
  @override
  final String? url;
  @override
  final String? thumbnail;
  @override
  final String thumbnailPath;
  @override
  final String mime;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? modifiedAt;
  @override
  final String? createdBy;
  @override
  final String? modifiedBy;

  /// Create a copy of AppFileDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFileDTOCopyWith<_AppFileDTO> get copyWith =>
      __$AppFileDTOCopyWithImpl<_AppFileDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppFileDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFileDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
      name,
      bucket,
      path,
      url,
      thumbnail,
      thumbnailPath,
      mime,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'AppFileDTO(id: $id, name: $name, bucket: $bucket, path: $path, url: $url, thumbnail: $thumbnail, thumbnailPath: $thumbnailPath, mime: $mime, metadata: $metadata, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$AppFileDTOCopyWith<$Res>
    implements $AppFileDTOCopyWith<$Res> {
  factory _$AppFileDTOCopyWith(
          _AppFileDTO value, $Res Function(_AppFileDTO) _then) =
      __$AppFileDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? bucket,
      String path,
      String? url,
      String? thumbnail,
      String thumbnailPath,
      String mime,
      Map<String, dynamic>? metadata,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String? createdBy,
      String? modifiedBy});
}

/// @nodoc
class __$AppFileDTOCopyWithImpl<$Res> implements _$AppFileDTOCopyWith<$Res> {
  __$AppFileDTOCopyWithImpl(this._self, this._then);

  final _AppFileDTO _self;
  final $Res Function(_AppFileDTO) _then;

  /// Create a copy of AppFileDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bucket = freezed,
    Object? path = null,
    Object? url = freezed,
    Object? thumbnail = freezed,
    Object? thumbnailPath = null,
    Object? mime = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = freezed,
    Object? modifiedBy = freezed,
  }) {
    return _then(_AppFileDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bucket: freezed == bucket
          ? _self.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailPath: null == thumbnailPath
          ? _self.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _self.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFile {
  /// Document id in Firestore. Null if File is not stored as an independent
  /// document. This field is not stored in Firestore. '0' If File has not been
  /// created yet in the database.
  String? get id;

  /// String with file name with extension but without path. Only for readability
  /// and user experience purposes.
  ///
  /// Keep in mind that "name" will preserve original file name, but path will
  /// be modified to guarantee that it is unique in the bucket.
  String get name;

  /// String with bucket name. This is useful when project has to deal with
  /// multiple buckets. Null means the default bucket.
  String? get bucket;

  /// String with full and actual path and name of the file in Firebase storage.
  /// Original file name is modified to guarantee that it is unique.
  ///
  /// Keep in mind that "name" will preserve original file name, but path will
  /// be modified to guarantee that it is unique in the bucket.
  /// if is a video file, the path contains the video id.
  String get path;

  /// Download URL for file. If null, means that it hasn't been generated yet.
  String? get url;

  /// Download URL for thumbnail file. If null, means that it hasn't been generated yet.
  String? get thumbnail;

  /// Path of the thumbnail file in Firebase storage. Original file name is
  String get thumbnailPath;

  /// MIME type of the file (e.g., 'image/jpeg', 'video/mp4'). Used to determine
  /// how to handle and display the file.
  String get mime;

  /// Metadata of file. Contains information about the file, like size or any
  /// other attribute for specific use in each module. Null if no metadata was
  /// stored.
  Map<String, dynamic>? get metadata;

  /// Timestamp of creation.
  DateTime? get createdAt;

  /// Timestamp of the last modification
  DateTime? get modifiedAt;

  /// UID of user who created the File.
  String? get createdBy;

  /// UID of user who modified the File for the last time.
  String? get modifiedBy;

  /// Create a copy of AppFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFileCopyWith<AppFile> get copyWith =>
      _$AppFileCopyWithImpl<AppFile>(this as AppFile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFile &&
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
    return 'AppFile(id: $id, name: $name, bucket: $bucket, path: $path, url: $url, thumbnail: $thumbnail, thumbnailPath: $thumbnailPath, mime: $mime, metadata: $metadata, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $AppFileCopyWith<$Res> {
  factory $AppFileCopyWith(AppFile value, $Res Function(AppFile) _then) =
      _$AppFileCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? bucket,
      String path,
      String? url,
      String? thumbnail,
      String thumbnailPath,
      String mime,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String? createdBy,
      String? modifiedBy});
}

/// @nodoc
class _$AppFileCopyWithImpl<$Res> implements $AppFileCopyWith<$Res> {
  _$AppFileCopyWithImpl(this._self, this._then);

  final AppFile _self;
  final $Res Function(AppFile) _then;

  /// Create a copy of AppFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _AppFile extends AppFile {
  const _AppFile(
      {required this.id,
      required this.name,
      required this.bucket,
      required this.path,
      required this.url,
      required this.thumbnail,
      required this.thumbnailPath,
      required this.mime,
      required final Map<String, dynamic>? metadata,
      required this.createdAt,
      required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy})
      : _metadata = metadata,
        super._();

  /// Document id in Firestore. Null if File is not stored as an independent
  /// document. This field is not stored in Firestore. '0' If File has not been
  /// created yet in the database.
  @override
  final String? id;

  /// String with file name with extension but without path. Only for readability
  /// and user experience purposes.
  ///
  /// Keep in mind that "name" will preserve original file name, but path will
  /// be modified to guarantee that it is unique in the bucket.
  @override
  final String name;

  /// String with bucket name. This is useful when project has to deal with
  /// multiple buckets. Null means the default bucket.
  @override
  final String? bucket;

  /// String with full and actual path and name of the file in Firebase storage.
  /// Original file name is modified to guarantee that it is unique.
  ///
  /// Keep in mind that "name" will preserve original file name, but path will
  /// be modified to guarantee that it is unique in the bucket.
  /// if is a video file, the path contains the video id.
  @override
  final String path;

  /// Download URL for file. If null, means that it hasn't been generated yet.
  @override
  final String? url;

  /// Download URL for thumbnail file. If null, means that it hasn't been generated yet.
  @override
  final String? thumbnail;

  /// Path of the thumbnail file in Firebase storage. Original file name is
  @override
  final String thumbnailPath;

  /// MIME type of the file (e.g., 'image/jpeg', 'video/mp4'). Used to determine
  /// how to handle and display the file.
  @override
  final String mime;

  /// Metadata of file. Contains information about the file, like size or any
  /// other attribute for specific use in each module. Null if no metadata was
  /// stored.
  final Map<String, dynamic>? _metadata;

  /// Metadata of file. Contains information about the file, like size or any
  /// other attribute for specific use in each module. Null if no metadata was
  /// stored.
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Timestamp of creation.
  @override
  final DateTime? createdAt;

  /// Timestamp of the last modification
  @override
  final DateTime? modifiedAt;

  /// UID of user who created the File.
  @override
  final String? createdBy;

  /// UID of user who modified the File for the last time.
  @override
  final String? modifiedBy;

  /// Create a copy of AppFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFileCopyWith<_AppFile> get copyWith =>
      __$AppFileCopyWithImpl<_AppFile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFile &&
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
    return 'AppFile(id: $id, name: $name, bucket: $bucket, path: $path, url: $url, thumbnail: $thumbnail, thumbnailPath: $thumbnailPath, mime: $mime, metadata: $metadata, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$AppFileCopyWith<$Res> implements $AppFileCopyWith<$Res> {
  factory _$AppFileCopyWith(_AppFile value, $Res Function(_AppFile) _then) =
      __$AppFileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? bucket,
      String path,
      String? url,
      String? thumbnail,
      String thumbnailPath,
      String mime,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String? createdBy,
      String? modifiedBy});
}

/// @nodoc
class __$AppFileCopyWithImpl<$Res> implements _$AppFileCopyWith<$Res> {
  __$AppFileCopyWithImpl(this._self, this._then);

  final _AppFile _self;
  final $Res Function(_AppFile) _then;

  /// Create a copy of AppFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
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
    return _then(_AppFile(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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

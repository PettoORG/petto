import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petto/core/domain/json_converter/timestamp_converter.dart';
import 'package:petto/core/files/domain/app_file.dart';
import 'package:petto/core/infrastructure/base_dto.dart';
import 'package:petto/users/domain/user.dart';

part 'app_file_dto.freezed.dart';
part 'app_file_dto.g.dart';

@freezed
sealed class AppFileDTO with _$AppFileDTO implements BaseDTO<AppFile> {
  const AppFileDTO._();

  const factory AppFileDTO({
    @Default('0') String id,
    required String name,
    String? bucket,
    required String path,
    String? url,
    String? thumbnail,
    required String thumbnailPath,
    required String mime,
    Map<String, dynamic>? metadata,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? modifiedAt,
    String? createdBy,
    String? modifiedBy,
  }) = _AppFileDTO;

  factory AppFileDTO.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppFileDTO.fromJson(data).copyWith(id: doc.id);
  }

  factory AppFileDTO.fromDomain(AppFile appFile) {
    return AppFileDTO(
      id: appFile.id!,
      name: appFile.name,
      bucket: appFile.bucket,
      path: appFile.path,
      url: appFile.url,
      mime: appFile.mime,
      thumbnail: appFile.thumbnail,
      thumbnailPath: appFile.thumbnailPath,
      metadata: appFile.metadata,
      createdAt: appFile.createdAt,
      modifiedAt: appFile.modifiedAt,
      createdBy: appFile.createdBy,
      modifiedBy: appFile.modifiedBy,
    );
  }

  factory AppFileDTO.fromJson(Map<String, dynamic> json) => _$AppFileDTOFromJson(json);

  @override
  Map<String, dynamic> toDocument() => toJson()..remove('id');

  @override
  Map<String, dynamic> toCreateDocument(User user) {
    final now = DateTime.now();
    return copyWith(
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
  AppFile toDomain() {
    return AppFile(
      id: id,
      name: name,
      bucket: bucket,
      path: path,
      url: url,
      mime: mime,
      thumbnail: thumbnail,
      thumbnailPath: thumbnailPath,
      metadata: metadata,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
    );
  }
}

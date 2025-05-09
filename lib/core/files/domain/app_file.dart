import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_file.freezed.dart';

/// Describes any file as it should be stored in Firebase Firestore.
@freezed
sealed class AppFile with _$AppFile {
  const AppFile._();

  const factory AppFile({
    /// Document id in Firestore. Null if File is not stored as an independent
    /// document. This field is not stored in Firestore. '0' If File has not been
    /// created yet in the database.
    required String? id,

    /// String with file name with extension but without path. Only for readability
    /// and user experience purposes.
    ///
    /// Keep in mind that "name" will preserve original file name, but path will
    /// be modified to guarantee that it is unique in the bucket.
    required String name,

    /// String with bucket name. This is useful when project has to deal with
    /// multiple buckets. Null means the default bucket.
    required String? bucket,

    /// String with full and actual path and name of the file in Firebase storage.
    /// Original file name is modified to guarantee that it is unique.
    ///
    /// Keep in mind that "name" will preserve original file name, but path will
    /// be modified to guarantee that it is unique in the bucket.
    /// if is a video file, the path contains the video id.
    required String path,

    /// Download URL for file. If null, means that it hasn't been generated yet.
    required String? url,

    /// Download URL for thumbnail file. If null, means that it hasn't been generated yet.
    required String? thumbnail,

    /// Path of the thumbnail file in Firebase storage. Original file name is
    required String thumbnailPath,

    /// MIME type of the file (e.g., 'image/jpeg', 'video/mp4'). Used to determine
    /// how to handle and display the file.
    required String mime,

    /// Metadata of file. Contains information about the file, like size or any
    /// other attribute for specific use in each module. Null if no metadata was
    /// stored.
    required Map<String, dynamic>? metadata,

    /// Timestamp of creation.
    required DateTime? createdAt,

    /// Timestamp of the last modification
    required DateTime? modifiedAt,

    /// UID of user who created the File.
    required String? createdBy,

    /// UID of user who modified the File for the last time.
    required String? modifiedBy,
  }) = _AppFile;

  /// Creates an empty file.
  factory AppFile.empty() => AppFile(
        id: '0',
        name: '',
        bucket: null,
        path: '',
        url: null,
        thumbnail: null,
        thumbnailPath: '',
        mime: '',
        metadata: null,
        createdAt: DateTime.now(),
        modifiedAt: null,
        createdBy: null,
        modifiedBy: null,
      );
}

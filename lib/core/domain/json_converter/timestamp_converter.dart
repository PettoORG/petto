import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Custom converter para los Timestamp de Firestore.
///
/// check: https://stackoverflow.com/a/62462178/11652243
/// https://gist.github.com/slightfoot/c008a8f083b46f89bef9987ab2bd34fa
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

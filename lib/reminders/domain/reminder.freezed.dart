// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reminder {
  /// Document ID in the database.
  String get id;

  /// ID of the user who created the reminder.
  String get userId;

  /// List of pet IDs the reminder applies to. Can be empty for general reminders.
  List<String> get petIds;

  /// Reminder title (e.g., "Rabies vaccine", "Monthly bath").
  String get title;

  /// Additional notes or instructions.
  String get description;

  /// Date and time when the reminder is scheduled.
  DateTime get scheduledAt;

  /// Whether the reminder repeats over time.
  bool get isRecurring;

  /// Recurrence frequency type.
  ReminderFrequency get frequency;

  /// Optional end date for the recurrence.
  DateTime? get recurrenceEndsAt;

  /// Whether the reminder is currently active.
  bool get active;

  /// Record creation timestamp.
  DateTime? get createdAt;

  /// Last modification timestamp.
  DateTime? get modifiedAt;

  /// UID of the user who created the record.
  String get createdBy;

  /// UID of the user who last modified the record.
  String get modifiedBy;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderCopyWith<Reminder> get copyWith =>
      _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Reminder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.petIds, petIds) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.recurrenceEndsAt, recurrenceEndsAt) ||
                other.recurrenceEndsAt == recurrenceEndsAt) &&
            (identical(other.active, active) || other.active == active) &&
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
      userId,
      const DeepCollectionEquality().hash(petIds),
      title,
      description,
      scheduledAt,
      isRecurring,
      frequency,
      recurrenceEndsAt,
      active,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'Reminder(id: $id, userId: $userId, petIds: $petIds, title: $title, description: $description, scheduledAt: $scheduledAt, isRecurring: $isRecurring, frequency: $frequency, recurrenceEndsAt: $recurrenceEndsAt, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) =
      _$ReminderCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> petIds,
      String title,
      String description,
      DateTime scheduledAt,
      bool isRecurring,
      ReminderFrequency frequency,
      DateTime? recurrenceEndsAt,
      bool active,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? petIds = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? isRecurring = null,
    Object? frequency = null,
    Object? recurrenceEndsAt = freezed,
    Object? active = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      petIds: null == petIds
          ? _self.petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRecurring: null == isRecurring
          ? _self.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      frequency: null == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as ReminderFrequency,
      recurrenceEndsAt: freezed == recurrenceEndsAt
          ? _self.recurrenceEndsAt
          : recurrenceEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedBy: null == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Reminder extends Reminder {
  const _Reminder(
      {required this.id,
      required this.userId,
      required final List<String> petIds,
      required this.title,
      required this.description,
      required this.scheduledAt,
      required this.isRecurring,
      required this.frequency,
      required this.recurrenceEndsAt,
      required this.active,
      required this.createdAt,
      required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy})
      : _petIds = petIds,
        super._();

  /// Document ID in the database.
  @override
  final String id;

  /// ID of the user who created the reminder.
  @override
  final String userId;

  /// List of pet IDs the reminder applies to. Can be empty for general reminders.
  final List<String> _petIds;

  /// List of pet IDs the reminder applies to. Can be empty for general reminders.
  @override
  List<String> get petIds {
    if (_petIds is EqualUnmodifiableListView) return _petIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petIds);
  }

  /// Reminder title (e.g., "Rabies vaccine", "Monthly bath").
  @override
  final String title;

  /// Additional notes or instructions.
  @override
  final String description;

  /// Date and time when the reminder is scheduled.
  @override
  final DateTime scheduledAt;

  /// Whether the reminder repeats over time.
  @override
  final bool isRecurring;

  /// Recurrence frequency type.
  @override
  final ReminderFrequency frequency;

  /// Optional end date for the recurrence.
  @override
  final DateTime? recurrenceEndsAt;

  /// Whether the reminder is currently active.
  @override
  final bool active;

  /// Record creation timestamp.
  @override
  final DateTime? createdAt;

  /// Last modification timestamp.
  @override
  final DateTime? modifiedAt;

  /// UID of the user who created the record.
  @override
  final String createdBy;

  /// UID of the user who last modified the record.
  @override
  final String modifiedBy;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderCopyWith<_Reminder> get copyWith =>
      __$ReminderCopyWithImpl<_Reminder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reminder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._petIds, _petIds) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.recurrenceEndsAt, recurrenceEndsAt) ||
                other.recurrenceEndsAt == recurrenceEndsAt) &&
            (identical(other.active, active) || other.active == active) &&
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
      userId,
      const DeepCollectionEquality().hash(_petIds),
      title,
      description,
      scheduledAt,
      isRecurring,
      frequency,
      recurrenceEndsAt,
      active,
      createdAt,
      modifiedAt,
      createdBy,
      modifiedBy);

  @override
  String toString() {
    return 'Reminder(id: $id, userId: $userId, petIds: $petIds, title: $title, description: $description, scheduledAt: $scheduledAt, isRecurring: $isRecurring, frequency: $frequency, recurrenceEndsAt: $recurrenceEndsAt, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) =
      __$ReminderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> petIds,
      String title,
      String description,
      DateTime scheduledAt,
      bool isRecurring,
      ReminderFrequency frequency,
      DateTime? recurrenceEndsAt,
      bool active,
      DateTime? createdAt,
      DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class __$ReminderCopyWithImpl<$Res> implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? petIds = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? isRecurring = null,
    Object? frequency = null,
    Object? recurrenceEndsAt = freezed,
    Object? active = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
    Object? createdBy = null,
    Object? modifiedBy = null,
  }) {
    return _then(_Reminder(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      petIds: null == petIds
          ? _self._petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRecurring: null == isRecurring
          ? _self.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      frequency: null == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as ReminderFrequency,
      recurrenceEndsAt: freezed == recurrenceEndsAt
          ? _self.recurrenceEndsAt
          : recurrenceEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _self.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedBy: null == modifiedBy
          ? _self.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

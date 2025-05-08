// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderDTO {
  String get id;
  String get userId;
  List<String> get petIds;
  String get title;
  String get description;
  @TimestampConverter()
  DateTime get scheduledAt;
  bool get isRecurring;
  ReminderFrequency get frequency;
  @TimestampConverter()
  DateTime? get recurrenceEndsAt;
  bool get active;
  @TimestampConverter()
  DateTime? get createdAt;
  @TimestampConverter()
  DateTime? get modifiedAt;
  String get createdBy;
  String get modifiedBy;

  /// Create a copy of ReminderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderDTOCopyWith<ReminderDTO> get copyWith =>
      _$ReminderDTOCopyWithImpl<ReminderDTO>(this as ReminderDTO, _$identity);

  /// Serializes this ReminderDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReminderDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'ReminderDTO(id: $id, userId: $userId, petIds: $petIds, title: $title, description: $description, scheduledAt: $scheduledAt, isRecurring: $isRecurring, frequency: $frequency, recurrenceEndsAt: $recurrenceEndsAt, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class $ReminderDTOCopyWith<$Res> {
  factory $ReminderDTOCopyWith(
          ReminderDTO value, $Res Function(ReminderDTO) _then) =
      _$ReminderDTOCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> petIds,
      String title,
      String description,
      @TimestampConverter() DateTime scheduledAt,
      bool isRecurring,
      ReminderFrequency frequency,
      @TimestampConverter() DateTime? recurrenceEndsAt,
      bool active,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class _$ReminderDTOCopyWithImpl<$Res> implements $ReminderDTOCopyWith<$Res> {
  _$ReminderDTOCopyWithImpl(this._self, this._then);

  final ReminderDTO _self;
  final $Res Function(ReminderDTO) _then;

  /// Create a copy of ReminderDTO
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
@JsonSerializable()
class _ReminderDTO extends ReminderDTO {
  const _ReminderDTO(
      {this.id = '0',
      required this.userId,
      required final List<String> petIds,
      required this.title,
      required this.description,
      @TimestampConverter() required this.scheduledAt,
      required this.isRecurring,
      required this.frequency,
      @TimestampConverter() required this.recurrenceEndsAt,
      required this.active,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.modifiedAt,
      required this.createdBy,
      required this.modifiedBy})
      : _petIds = petIds,
        super._();
  factory _ReminderDTO.fromJson(Map<String, dynamic> json) =>
      _$ReminderDTOFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String userId;
  final List<String> _petIds;
  @override
  List<String> get petIds {
    if (_petIds is EqualUnmodifiableListView) return _petIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petIds);
  }

  @override
  final String title;
  @override
  final String description;
  @override
  @TimestampConverter()
  final DateTime scheduledAt;
  @override
  final bool isRecurring;
  @override
  final ReminderFrequency frequency;
  @override
  @TimestampConverter()
  final DateTime? recurrenceEndsAt;
  @override
  final bool active;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? modifiedAt;
  @override
  final String createdBy;
  @override
  final String modifiedBy;

  /// Create a copy of ReminderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderDTOCopyWith<_ReminderDTO> get copyWith =>
      __$ReminderDTOCopyWithImpl<_ReminderDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReminderDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReminderDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'ReminderDTO(id: $id, userId: $userId, petIds: $petIds, title: $title, description: $description, scheduledAt: $scheduledAt, isRecurring: $isRecurring, frequency: $frequency, recurrenceEndsAt: $recurrenceEndsAt, active: $active, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy)';
  }
}

/// @nodoc
abstract mixin class _$ReminderDTOCopyWith<$Res>
    implements $ReminderDTOCopyWith<$Res> {
  factory _$ReminderDTOCopyWith(
          _ReminderDTO value, $Res Function(_ReminderDTO) _then) =
      __$ReminderDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> petIds,
      String title,
      String description,
      @TimestampConverter() DateTime scheduledAt,
      bool isRecurring,
      ReminderFrequency frequency,
      @TimestampConverter() DateTime? recurrenceEndsAt,
      bool active,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? modifiedAt,
      String createdBy,
      String modifiedBy});
}

/// @nodoc
class __$ReminderDTOCopyWithImpl<$Res> implements _$ReminderDTOCopyWith<$Res> {
  __$ReminderDTOCopyWithImpl(this._self, this._then);

  final _ReminderDTO _self;
  final $Res Function(_ReminderDTO) _then;

  /// Create a copy of ReminderDTO
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
    return _then(_ReminderDTO(
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

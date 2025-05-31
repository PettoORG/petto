// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderVM {
  String get id;
  List<String> get petIds;
  List<String> get assigneeIds;
  ReminderType get type;
  String get title;
  String get description;
  DateTime get scheduledAt;
  bool get isRecurring;
  ReminderFrequency get frequency;
  DateTime? get recurrenceEndsAt;

  /// Create a copy of ReminderVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderVMCopyWith<ReminderVM> get copyWith =>
      _$ReminderVMCopyWithImpl<ReminderVM>(this as ReminderVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReminderVM &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.petIds, petIds) &&
            const DeepCollectionEquality()
                .equals(other.assigneeIds, assigneeIds) &&
            (identical(other.type, type) || other.type == type) &&
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
                other.recurrenceEndsAt == recurrenceEndsAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(petIds),
      const DeepCollectionEquality().hash(assigneeIds),
      type,
      title,
      description,
      scheduledAt,
      isRecurring,
      frequency,
      recurrenceEndsAt);

  @override
  String toString() {
    return 'ReminderVM(id: $id, petIds: $petIds, assigneeIds: $assigneeIds, type: $type, title: $title, description: $description, scheduledAt: $scheduledAt, isRecurring: $isRecurring, frequency: $frequency, recurrenceEndsAt: $recurrenceEndsAt)';
  }
}

/// @nodoc
abstract mixin class $ReminderVMCopyWith<$Res> {
  factory $ReminderVMCopyWith(
          ReminderVM value, $Res Function(ReminderVM) _then) =
      _$ReminderVMCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      List<String> petIds,
      List<String> assigneeIds,
      ReminderType type,
      String title,
      String description,
      DateTime scheduledAt,
      bool isRecurring,
      ReminderFrequency frequency,
      DateTime? recurrenceEndsAt});
}

/// @nodoc
class _$ReminderVMCopyWithImpl<$Res> implements $ReminderVMCopyWith<$Res> {
  _$ReminderVMCopyWithImpl(this._self, this._then);

  final ReminderVM _self;
  final $Res Function(ReminderVM) _then;

  /// Create a copy of ReminderVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petIds = null,
    Object? assigneeIds = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? isRecurring = null,
    Object? frequency = null,
    Object? recurrenceEndsAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petIds: null == petIds
          ? _self.petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      assigneeIds: null == assigneeIds
          ? _self.assigneeIds
          : assigneeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
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
    ));
  }
}

/// @nodoc

class _ReminderVM extends ReminderVM {
  const _ReminderVM(
      {required this.id,
      required final List<String> petIds,
      required final List<String> assigneeIds,
      required this.type,
      required this.title,
      required this.description,
      required this.scheduledAt,
      required this.isRecurring,
      required this.frequency,
      required this.recurrenceEndsAt})
      : _petIds = petIds,
        _assigneeIds = assigneeIds,
        super._();

  @override
  final String id;
  final List<String> _petIds;
  @override
  List<String> get petIds {
    if (_petIds is EqualUnmodifiableListView) return _petIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petIds);
  }

  final List<String> _assigneeIds;
  @override
  List<String> get assigneeIds {
    if (_assigneeIds is EqualUnmodifiableListView) return _assigneeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assigneeIds);
  }

  @override
  final ReminderType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime scheduledAt;
  @override
  final bool isRecurring;
  @override
  final ReminderFrequency frequency;
  @override
  final DateTime? recurrenceEndsAt;

  /// Create a copy of ReminderVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderVMCopyWith<_ReminderVM> get copyWith =>
      __$ReminderVMCopyWithImpl<_ReminderVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReminderVM &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._petIds, _petIds) &&
            const DeepCollectionEquality()
                .equals(other._assigneeIds, _assigneeIds) &&
            (identical(other.type, type) || other.type == type) &&
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
                other.recurrenceEndsAt == recurrenceEndsAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_petIds),
      const DeepCollectionEquality().hash(_assigneeIds),
      type,
      title,
      description,
      scheduledAt,
      isRecurring,
      frequency,
      recurrenceEndsAt);

  @override
  String toString() {
    return 'ReminderVM(id: $id, petIds: $petIds, assigneeIds: $assigneeIds, type: $type, title: $title, description: $description, scheduledAt: $scheduledAt, isRecurring: $isRecurring, frequency: $frequency, recurrenceEndsAt: $recurrenceEndsAt)';
  }
}

/// @nodoc
abstract mixin class _$ReminderVMCopyWith<$Res>
    implements $ReminderVMCopyWith<$Res> {
  factory _$ReminderVMCopyWith(
          _ReminderVM value, $Res Function(_ReminderVM) _then) =
      __$ReminderVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> petIds,
      List<String> assigneeIds,
      ReminderType type,
      String title,
      String description,
      DateTime scheduledAt,
      bool isRecurring,
      ReminderFrequency frequency,
      DateTime? recurrenceEndsAt});
}

/// @nodoc
class __$ReminderVMCopyWithImpl<$Res> implements _$ReminderVMCopyWith<$Res> {
  __$ReminderVMCopyWithImpl(this._self, this._then);

  final _ReminderVM _self;
  final $Res Function(_ReminderVM) _then;

  /// Create a copy of ReminderVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? petIds = null,
    Object? assigneeIds = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? scheduledAt = null,
    Object? isRecurring = null,
    Object? frequency = null,
    Object? recurrenceEndsAt = freezed,
  }) {
    return _then(_ReminderVM(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petIds: null == petIds
          ? _self._petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      assigneeIds: null == assigneeIds
          ? _self._assigneeIds
          : assigneeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
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
    ));
  }
}

// dart format on

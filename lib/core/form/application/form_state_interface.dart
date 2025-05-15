import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Defines a minimal structure for app forms.
abstract interface class FormStateInterface<Entity, EntityVM> {
  /// The Form Key.
  abstract final GlobalKey<FormBuilderState> fk;

  /// The "loading" state of the Form.
  abstract bool loading;

  /// Whether the form has already been validated.
  abstract bool alreadyValidated;

  /// The values of the form.
  abstract EntityVM values;

  /// Transforms the Entity into a FormModel and populates the form.
  EntityVM populate(Entity entity);

  /// Extracts the data of the Form and returns it as a FormModel.
  EntityVM extract();

  /// Handles the "changes" of the form.
  void onChanged();

  /// Validates the form. If [markAsLoading] is true, it sets the form as
  /// 'loading'.
  bool validate({bool markAsLoading = false});

  /// Saves the form. If [validateForm] is true, it validates the form.
  Future<void> save({bool validateForm = true});

  /// Checks if the form's 'touched' state has changed and updates it.
  void checkTouched();

  /// Sets the 'touched' state of the form.
  void setTouchedState(bool touched);

  /// REturns a FormBuilderFieldState from a [fieldName].
  FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? fieldRef(String fieldName);

  /// Returns a value from a [fieldName].
  dynamic getField<T>(String fieldName) => fieldRef(fieldName)?.value as T;

  /// Sets the [value] of a [fieldName].
  setField(String fieldName, dynamic value) => fieldRef(fieldName)?.didChange(value);
}

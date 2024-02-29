import 'package:formz/formz.dart';

/// Enum representing possible validation errors for the [Text] class.
enum TextValidationError {
  /// Text input is empty
  empty,
}

/// {@template text}
/// A [FormzInput] subclass representing a text input field.
///
/// It validates that the text is not empty.
/// {@endtemplate}
class Text extends FormzInput<String, TextValidationError> {
  /// Constructs a pure [Text] input field.
  ///
  /// A pure [Text] input field has not been touched by the user.
  /// The provided value defaults to an empty string.
  const Text.pure() : super.pure('');

  /// Constructs a dirty [Text] input field.
  ///
  /// A dirty [Text] input field has been touched by the user.
  /// The provided value defaults to an empty string.
  const Text.dirty([super.value = '']) : super.dirty();

  /// Validates the text input.
  ///
  /// Returns [TextValidationError.empty] if the text is empty.
  /// Returns `null` if the text is not empty.
  @override
  TextValidationError? validator(String value) {
    return value.isNotEmpty ? null : TextValidationError.empty;
  }
}

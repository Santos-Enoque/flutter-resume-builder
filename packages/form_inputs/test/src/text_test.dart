// ignore_for_file: prefer_const_constructors

import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const textString = 'test';

  group('Text', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final text = Text.pure();
        expect(text.value, '');
        expect(text.isPure, true);
      });

      test('dirty creates correct instance', () {
        final text = Text.dirty(textString);
        expect(text.value, textString);
        expect(text.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when text is empty', () {
        expect(
          Text.dirty().error,
          TextValidationError.empty,
        );
      });

      test('is valid when text is not empty', () {
        expect(
          Text.dirty(textString).error,
          isNull,
        );
      });
    });
  });
}

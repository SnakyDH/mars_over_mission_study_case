import 'package:formz/formz.dart';

enum XValidationError { empty, invalid }

class ValidateXPosition extends FormzInput<int, XValidationError> {
  const ValidateXPosition.pure() : super.pure(0);
  const ValidateXPosition.dirty([super.value = 0]) : super.dirty();

  @override
  XValidationError? validator(int value) {
    if (value == 0) {
      return XValidationError.empty;
    }
    if (value < 0 || value > 200) {
      return XValidationError.invalid;
    }
    return null;
  }
}

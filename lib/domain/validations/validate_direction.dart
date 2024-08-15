import 'package:formz/formz.dart';
import 'package:mars_rover_mission/domain/entities/direction.dart';

enum DirectionValidationError { empty }

class ValidateDirection extends FormzInput<String, DirectionValidationError> {
  const ValidateDirection.pure() : super.pure("Select Direction");
  const ValidateDirection.dirty([super.value = '']) : super.dirty();

  @override
  DirectionValidationError? validator(String value) {
    if (value == Direction.empty().name) {
      return DirectionValidationError.empty;
    }
    return null;
  }
}

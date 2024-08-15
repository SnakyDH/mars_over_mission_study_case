import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mars_rover_mission/domain/validations/validate_direction.dart';
import 'package:mars_rover_mission/domain/validations/validate_x_position.dart';
import 'package:mars_rover_mission/domain/validations/validate_y_position.dart';

part 'game_set_up_event.dart';
part 'game_set_up_state.dart';

class GameSetUpBloc extends Bloc<GameSetUpEvent, GameSetUpState> {
  GameSetUpBloc() : super(GameSetUpInitial()) {
    on<XPositionChanged>(_onXPositionChanged);
    on<YPositionChanged>(_onYPositionChanged);
    on<DirectionChanged>(_onDirectionChanged);
    on<SubmitGameSetUp>(_onSubmitGameSetUp);
  }
  void _onXPositionChanged(
    XPositionChanged event,
    Emitter<GameSetUpState> emit,
  ) {
    final xPosition = ValidateXPosition.dirty(event.xPosition);
    emit(
      state.copyWith(
        xPosition: xPosition,
        isValid: Formz.validate(
          [
            state.yPosition,
            state.direction,
            xPosition,
          ],
        ),
      ),
    );
  }

  void _onYPositionChanged(
    YPositionChanged event,
    Emitter<GameSetUpState> emit,
  ) {
    final yPosition = ValidateYPosition.dirty(event.yPosition);
    emit(
      state.copyWith(
        yPosition: yPosition,
        isValid: Formz.validate(
          [
            state.xPosition,
            state.direction,
            yPosition,
          ],
        ),
      ),
    );
  }

  void _onDirectionChanged(
    DirectionChanged event,
    Emitter<GameSetUpState> emit,
  ) {
    final direction = ValidateDirection.dirty(event.direction);
    emit(
      state.copyWith(
        direction: direction,
        isValid: Formz.validate(
          [
            state.xPosition,
            state.yPosition,
            direction,
          ],
        ),
      ),
    );
  }

  void _onSubmitGameSetUp(
    SubmitGameSetUp event,
    Emitter<GameSetUpState> emit,
  ) {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.failure));
  }
}

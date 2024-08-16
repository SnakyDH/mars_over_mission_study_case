import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  static Timer? movementTimer;
  RoverBloc() : super(const RoverState(movements: [])) {
    on<MoveRover>(_onMoveRover);
  }

  void _onMoveRover(MoveRover event, Emitter<RoverState> emit) {
    if (state.status == RoverStatus.stopped && state.movements.length < 10) {
      emit(state.copyWith(
        status: RoverStatus.stopped,
        movements: [...state.movements, event.movement],
      ));
    }
  }


}

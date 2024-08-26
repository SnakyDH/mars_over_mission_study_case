import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rover_event.dart';
part 'rover_state.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  static Timer? movementTimer;
  RoverBloc() : super(const RoverState(movements: [])) {
    on<MoveRover>(_onMoveRover);
    on<AddMovement>(_onAddMovement);
    on<ExecuteMovements>(_onExecuteMovements);
    on<RoverMove>(_onRoverMove);
    on<RoverStop>(_onRoverStop);
  }

  void _onMoveRover(MoveRover event, Emitter<RoverState> emit) {
    if (state.status == RoverStatus.stopped) {
      emit(state.copyWith(
        status: RoverStatus.stopped,
        movements: [...state.movements, event.movement],
      ));
    }
  }

  _onAddMovement(AddMovement event, Emitter<RoverState> emit) {
    if (state.status == RoverStatus.stopped) {
      emit(
        state.copyWith(
          movements: [...state.movements, event.movement],
        ),
      );
    }
  }

  _onExecuteMovements(ExecuteMovements event, Emitter<RoverState> emit) {
    if (state.status == RoverStatus.stopped && state.movements.isNotEmpty) {
      movementTimer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          add(RoverMove());
        },
      );
      emit(state.copyWith(
        status: RoverStatus.moving,
        movements: state.movements,
      ));
    }
  }

  _onRoverMove(RoverMove event, Emitter<RoverState> emit) {
    if (state.movements.isNotEmpty) {
      emit(state.copyWith(
        status: RoverStatus.moving,
        movements: state.movements.sublist(1),
      ));
    } else {
      add(RoverStop());
    }
  }

  _onRoverStop(RoverStop event, Emitter<RoverState> emit) {
    movementTimer?.cancel();
    emit(state.copyWith(
      status: RoverStatus.stopped,
      movements: [],
    ));
  }
}

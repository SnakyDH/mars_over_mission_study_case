part of 'rover_bloc.dart';

sealed class RoverEvent extends Equatable {
  const RoverEvent();

  @override
  List<Object> get props => [];
}

final class MoveRover extends RoverEvent {
  final RoverMovement movement;

  const MoveRover(this.movement);

  @override
  List<Object> get props => [movement];
}

part of 'game_set_up_bloc.dart';

sealed class GameSetUpEvent extends Equatable {
  const GameSetUpEvent();

  @override
  List<Object> get props => [];
}

final class XPositionChanged extends GameSetUpEvent {
  final int xPosition;

  const XPositionChanged(this.xPosition);

  @override
  List<Object> get props => [xPosition];
}

final class YPositionChanged extends GameSetUpEvent {
  final int yPosition;

  const YPositionChanged(this.yPosition);

  @override
  List<Object> get props => [yPosition];
}

final class DirectionChanged extends GameSetUpEvent {
  final String direction;

  const DirectionChanged(this.direction);

  @override
  List<Object> get props => [direction];
}

final class SubmitGameSetUp extends GameSetUpEvent {
  const SubmitGameSetUp();
}

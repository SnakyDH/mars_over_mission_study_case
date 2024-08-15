part of 'game_set_up_bloc.dart';

final class GameSetUpState extends Equatable {
  final FormzSubmissionStatus status;
  final ValidateXPosition xPosition;
  final ValidateYPosition yPosition;
  final ValidateDirection direction;
  final bool isValid;

  const GameSetUpState({
    this.status = FormzSubmissionStatus.initial,
    this.xPosition = const ValidateXPosition.pure(),
    this.yPosition = const ValidateYPosition.pure(),
    this.direction = const ValidateDirection.pure(),
    this.isValid = false,
  });

  GameSetUpState copyWith({
    FormzSubmissionStatus? status,
    ValidateXPosition? xPosition,
    ValidateYPosition? yPosition,
    ValidateDirection? direction,
    bool? isValid,
  }) =>
      GameSetUpState(
        status: status ?? this.status,
        xPosition: xPosition ?? this.xPosition,
        yPosition: yPosition ?? this.yPosition,
        direction: direction ?? this.direction,
        isValid: isValid ?? this.isValid,
      );

  @override
  List<Object> get props => [status, xPosition, yPosition, direction];
}

final class GameSetUpInitial extends GameSetUpState {}

part of 'username_bloc.dart';

sealed class UsernameEvent extends Equatable {
  const UsernameEvent();

  @override
  List<Object> get props => [];
}

class UserNameChanged extends UsernameEvent {
  final String username;

  const UserNameChanged(this.username);

  @override
  List<Object> get props => [username];
}

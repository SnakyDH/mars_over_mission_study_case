part of 'username_bloc.dart';

class UsernameState extends Equatable {
  final String username;

  const UsernameState({
    this.username = '',
  });

  UsernameState copyWith({
    String? username,
    bool? errorMessage,
  }) =>
      UsernameState(
        username: username ?? this.username,
      );

  @override
  List<Object> get props => [username];
}

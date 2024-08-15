import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_event.dart';
part 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  UsernameBloc() : super(const UsernameState()) {
    on<UserNameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
  }
}

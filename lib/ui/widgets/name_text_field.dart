import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/ui/blocs/bloc/username_bloc.dart';

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return TextField(
      onChanged: (value) => context.read<UsernameBloc>().add(
            UserNameChanged(value),
          ),
      decoration: InputDecoration(
        labelText: 'Type your name',
        filled: true,
        suffixIcon: Icon(
          Icons.person,
          color: appColors.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:mars_rover_mission/config/router/app_routes_name.dart';
import 'package:mars_rover_mission/ui/blocs/game_set_up/game_set_up_bloc.dart';
import 'package:mars_rover_mission/ui/layout/scaffold_username_app_bar_layout.dart';
import 'package:mars_rover_mission/ui/widgets/direction_controller.dart';
import 'package:mars_rover_mission/ui/widgets/selected_container.dart';
import 'package:mars_rover_mission/ui/widgets/standard_separator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).textTheme;

    return ScaffoldUsernameAppBarLayout(
      child: BlocListener<GameSetUpBloc, GameSetUpState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Invalid form'),
                ),
              );
          }
          if (state.status.isSuccess) {
            context.goNamed(AppRoutesName.gameScreen);
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Send initial position:',
                  style: appText.titleLarge,
                ),
                const StandardSeparator(),
                const Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _PositionInput(type: "X"),
                      _PositionInput(type: "Y"),
                    ],
                  ),
                ),
                const StandardSeparator(),
                BlocBuilder<GameSetUpBloc, GameSetUpState>(
                  builder: (context, state) {
                    return SelectedContainer(
                      text: state.direction.value,
                    );
                  },
                ),
                const StandardSeparator(),
                DirectionController(),
                const StandardSeparator(),
                const _FormSetUpSubmitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormSetUpSubmitButton extends StatelessWidget {
  const _FormSetUpSubmitButton();

  @override
  Widget build(BuildContext context) {
    final isValid = context.select(
      (GameSetUpBloc bloc) => bloc.state.isValid,
    );

    return FilledButton.icon(
      key: const Key('gameSetUpForm_button'),
      onPressed: isValid
          ? () => context.read<GameSetUpBloc>().add(const SubmitGameSetUp())
          : null,
      icon: const Icon(Icons.play_arrow),
      label: const Text("Start Game"),
    );
  }
}

class _PositionInput extends StatelessWidget {
  final String type;

  const _PositionInput({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final displayError = type == "X"
        ? context.select(
            (GameSetUpBloc bloc) => bloc.state.xPosition.isValid,
          )
        : context.select(
            (GameSetUpBloc bloc) => bloc.state.yPosition.isValid,
          );
    final onChanged = type == "X"
        ? (x) => context.read<GameSetUpBloc>().add(
              XPositionChanged(int.parse(x)),
            )
        : (y) => context.read<GameSetUpBloc>().add(
              YPositionChanged(int.parse(y)),
            );
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: type,
              errorText: displayError ? null : 'Range (0 - 200)',
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

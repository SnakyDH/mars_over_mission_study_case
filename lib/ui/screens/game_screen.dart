import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/domain/entities/mars.dart';
import 'package:mars_rover_mission/domain/entities/rover.dart';
import 'package:mars_rover_mission/ui/blocs/rover/rover_bloc.dart';
import 'package:mars_rover_mission/ui/layout/scaffold_username_app_bar_layout.dart';
import 'package:mars_rover_mission/ui/widgets/mars_map.dart';
import 'package:mars_rover_mission/ui/widgets/movement_controller.dart';
import 'package:mars_rover_mission/ui/widgets/selected_container.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  SizedBox _separator() => const SizedBox(height: 20);
  late Mars mars;
  late Rover rover;

  @override
  void initState() {
    mars = Mars();
    rover = Rover(mars: mars);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textApp = Theme.of(context).textTheme;
    return BlocBuilder<RoverBloc, RoverState>(
      builder: (context, state) {
        return ScaffoldUsernameAppBarLayout(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Mars',
                    textAlign: TextAlign.center,
                    style: textApp.headlineLarge,
                  ),
                  _separator(),
                  MarsMap(
                    mars: mars,
                    rover: rover,
                  ),
                  _separator(),
                  SelectedContainer(text: state.movements.join(' ')),
                  _separator(),
                  MovementController(),
                  _separator(),
                  FilledButton.icon(
                    onPressed: () {
                    // todo: send movement
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Send Movement"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mars_rover_mission/domain/entities/direction.dart';
import 'package:mars_rover_mission/domain/entities/mars.dart';
import 'package:mars_rover_mission/domain/entities/rover.dart';
import 'package:mars_rover_mission/ui/blocs/game_set_up/game_set_up_bloc.dart';
import 'package:mars_rover_mission/ui/blocs/rover/rover_bloc.dart';
import 'package:mars_rover_mission/ui/layout/scaffold_username_app_bar_layout.dart';
import 'package:mars_rover_mission/ui/widgets/ground_icon.dart';
import 'package:mars_rover_mission/ui/widgets/movement_controller.dart';
import 'package:mars_rover_mission/ui/widgets/obstacle_icon.dart';
import 'package:mars_rover_mission/ui/widgets/rover_icon.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textApp = Theme.of(context).textTheme;
    return BlocBuilder<RoverBloc, RoverState>(
      builder: (context, state) {
        if (state.status == RoverStatus.moving && state.movements.isNotEmpty) {
          bool hasMoved = rover.moveRover(state.movements[0]);
          if (!hasMoved) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Obstacle Detected'),
                  content: const Text(
                    'The rover has hit an obstacle. Please try again.',
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            });
            context.read<RoverBloc>().add(RoverStop());
          }
        }
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
                  BlocBuilder<GameSetUpBloc, GameSetUpState>(
                    builder: (context, state) {
                      // validate that the rover is not deployed
                      // if not, deploy the rover on the selected position
                      if (rover.x == null) {
                        rover.deployRoverOnSelectedPosition(
                          state.xPosition.value,
                          state.yPosition.value,
                          state.direction.value,
                        );
                      }

                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Mars.size,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1,
                          ),
                          itemCount: Mars.size * Mars.size,
                          itemBuilder: (BuildContext context, int index) {
                            int x = index ~/ Mars.size;
                            int y = index % Mars.size;
                            MarsType element = rover.mars.map[x][y];
                            switch (element) {
                              case MarsType.roverToEast:
                                return const RoverIcon(
                                  direction: Directions.east,
                                );
                              case MarsType.roverToNorth:
                                return const RoverIcon(
                                  direction: Directions.north,
                                );
                              case MarsType.roverToSouth:
                                return const RoverIcon(
                                  direction: Directions.south,
                                );
                              case MarsType.roverToWest:
                                return const RoverIcon(
                                  direction: Directions.west,
                                );
                              case MarsType.obstacle:
                                return const ObstacleIcon();
                              default:
                                return const GroundIcon();
                            }
                          },
                        ),
                      );
                    },
                  ),
                  _separator(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectedContainer(
                      text: state.movements.join(' '),
                    ),
                  ),
                  _separator(),
                  MovementController(),
                  _separator(),
                  FilledButton.icon(
                    onPressed: (state.movements.isEmpty) ||
                            (state.status == RoverStatus.moving)
                        ? null
                        : () => context.read<RoverBloc>().add(
                              const ExecuteMovements(),
                            ),
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

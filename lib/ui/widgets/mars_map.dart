import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/domain/entities/direction.dart';
import 'package:mars_rover_mission/domain/entities/mars.dart';
import 'package:mars_rover_mission/domain/entities/rover.dart';
import 'package:mars_rover_mission/ui/blocs/game_set_up/game_set_up_bloc.dart';
import 'package:mars_rover_mission/ui/widgets/ground_icon.dart';
import 'package:mars_rover_mission/ui/widgets/obstacle_icon.dart';
import 'package:mars_rover_mission/ui/widgets/rover_icon.dart';

class MarsMap extends StatelessWidget {
  final Mars mars;
  final Rover rover;

  const MarsMap({
    super.key,
    required this.mars,
    required this.rover,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameSetUpBloc, GameSetUpState>(
      builder: (context, state) {
        rover.deployRoverOnSelectedPosition(state.xPosition.value,
            state.yPosition.value, state.direction.value);
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}

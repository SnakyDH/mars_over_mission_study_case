import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/domain/entities/movement.dart';
import 'package:mars_rover_mission/ui/blocs/rover/rover_bloc.dart';
import 'package:mars_rover_mission/ui/widgets/controller_button.dart';

class MovementController extends StatelessWidget {
  MovementController({super.key});

  final Set<Movement> movements = {
    const Movement(Movements.up, Color(0xffFAE008)),
    const Movement(Movements.left, Color(0xffDD3336)),
    const Movement(Movements.right, Color(0xff0797DC)),
  };
  IconData getIcons(Movement movement) {
    switch (movement.name) {
      case Movements.up:
        return Icons.arrow_upward;
      case Movements.left:
        return Icons.arrow_back;
      case Movements.right:
        return Icons.arrow_forward;
      default:
        return Icons.arrow_upward;
    }
  }

  RoverMovement _parseToMovement(Movement mov) {
    switch (mov.name) {
      case Movements.up:
        return RoverMovement.forward;
      case Movements.left:
        return RoverMovement.left;
      case Movements.right:
        return RoverMovement.right;
      default:
        return RoverMovement.forward;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoverBloc, RoverState>(
      builder: (context, state) {
        return SizedBox(
          height: 300,
          width: 300,
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return const SizedBox();
              }
              final movement = movements.elementAt(index ~/ 2);

              return ControllerButton(
                onTap: () => context.read<RoverBloc>().add(
                      MoveRover(
                        _parseToMovement(movement),
                      ),
                    ),
                child: Icon(
                  getIcons(movement),
                  color: movement.color,
                  size: 40,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

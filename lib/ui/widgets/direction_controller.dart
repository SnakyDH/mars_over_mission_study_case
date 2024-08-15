import 'package:flutter/material.dart';
import 'package:mars_rover_mission/domain/entities/direction.dart';
import 'package:mars_rover_mission/ui/widgets/controller_button.dart';

class DirectionController extends StatelessWidget {
  DirectionController({super.key});

  final Set<Direction> directions = {
    Direction(Directions.north, const Color(0xff27F5EF)),
    Direction(Directions.west, const Color(0xffFFB6F9)),
    Direction(Directions.east, const Color(0xffD86255)),
    Direction(Directions.south, const Color(0xffD5F6FF)),
  };

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).textTheme;

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
        itemCount: 9,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return const SizedBox();
          }
          return ControllerButton(
            child: Text(
              directions.elementAt(index ~/ 2).name[0],
              style: TextStyle(
                color: directions.elementAt(index ~/ 2).color,
                fontSize: appText.headlineMedium?.fontSize,
                //fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

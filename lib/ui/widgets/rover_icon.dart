import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mars_rover_mission/domain/entities/direction.dart';

class RoverIcon extends StatelessWidget {
  final String direction;
  const RoverIcon({
    super.key,
    required this.direction,
  });
  // depending on the direction we are going to rotate the image
  double _calculateRotation() {
    double multiply = pi / 180;
    switch (direction) {
      case Directions.north:
        return 0 * multiply;
      case Directions.east:
        return 90 * multiply;
      case Directions.south:
        return 180 * multiply;
      case Directions.west:
        return 270 * multiply;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      alignment: FractionalOffset.center,
      angle: _calculateRotation(),
      child: Image.asset(
        'assets/images/rover_icon.png',
        fit: BoxFit.fill,
      ),
    );
  }
}

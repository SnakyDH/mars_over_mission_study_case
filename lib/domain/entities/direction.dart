import 'dart:ui';

class Direction {
  final String name;
  final Color color;
  Direction(this.name, this.color);

  factory Direction.empty() => Direction(
        "Select Direction",
        const Color(0xffffffff),
      );
}

abstract class Directions {
  static const north = "North";
  static const west = "West";
  static const east = "East";
  static const south = "South";
}

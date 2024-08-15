import 'dart:ui';

class Movement {
  final String name;
  final Color color;

  const Movement(
    this.name,
    this.color,
  );
}

abstract class Movements {
  static const String up = 'UP';
  static const String left = 'LEFT';
  static const String right = 'RIGHT';
}

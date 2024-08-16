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
  static const String up = 'F';
  static const String left = 'L';
  static const String right = 'R';
}

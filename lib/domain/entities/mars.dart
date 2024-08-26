import 'dart:math';

import 'package:mars_rover_mission/domain/entities/direction.dart';

class Mars {
  static const int size = 20;
  late List<List<MarsType>> map;

  Mars() {
    _generateMars();
  }

  int _randomNumber() {
    return Random().nextInt(size);
  }

  void saveRover(int x, int y, String direction) {
    switch (direction) {
      case Directions.north:
        map[x][y] = MarsType.roverToNorth;
        break;
      case Directions.east:
        map[x][y] = MarsType.roverToEast;
        break;
      case Directions.south:
        map[x][y] = MarsType.roverToSouth;
        break;
      case Directions.west:
        map[x][y] = MarsType.roverToWest;
        break;
    }
  }

  void removeRover(int x, int y) {
    map[x][y] = MarsType.ground;
  }

  _generateMars() {
    map = List.generate(size, (_) {
      return List.generate(size, (index) {
        return MarsType.ground;
      });
    });

    // fill with 200 obstacles
    for (int i = 0; i < size; i++) {
      int x = _randomNumber();
      int y = _randomNumber();
      if (map[x][y] == MarsType.ground) {
        map[x][y] = MarsType.obstacle;
        continue;
      }
    }
  }
}

enum MarsType {
  obstacle,
  roverToNorth,
  roverToEast,
  roverToSouth,
  roverToWest,
  ground,
}

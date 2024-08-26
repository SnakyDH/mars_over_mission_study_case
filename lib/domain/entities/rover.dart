import 'package:mars_rover_mission/domain/entities/direction.dart';
import 'package:mars_rover_mission/domain/entities/mars.dart';
import 'package:mars_rover_mission/ui/blocs/rover/rover_bloc.dart';

class Rover {
  late Mars mars;
  // * define the variables as int? because using this value (null) we can validate if the rover has been deployed
  int? x;
  int? y;
  late String direction;

  Rover({required this.mars});

  void deployRoverOnSelectedPosition(int x, int y, String direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    mars.saveRover(x, y, direction);
  }

  bool moveRover(RoverMovement movement) {
    switch (movement) {
      case RoverMovement.forward:
        return _moveRoverForward();
      case RoverMovement.left:
        return _moveRoverLeft();
      case RoverMovement.right:
        return _moveRoverRight();
      default:
        return false;
    }
  }

  bool _moveRoverForward() {
    switch (direction) {
      case Directions.north:
        return _moveToNewPosition(x! - 1, y!);
      case Directions.east:
        return _moveToNewPosition(x!, y! + 1);
      case Directions.south:
        return _moveToNewPosition(x! + 1, y!);
      case Directions.west:
        return _moveToNewPosition(x!, y! - 1);
    }
    return false;
  }

  bool _moveRoverLeft() {
    switch (direction) {
      case Directions.north:
        direction = Directions.west;
        return _moveToNewPosition(x!, y! - 1);
      case Directions.east:
        direction = Directions.north;
        return _moveToNewPosition(x! - 1, y!);
      case Directions.south:
        direction = Directions.east;
        return _moveToNewPosition(x!, y! + 1);
      case Directions.west:
        direction = Directions.south;
        return _moveToNewPosition(x! + 1, y!);
    }
    return false;
  }

  bool _moveRoverRight() {
    switch (direction) {
      case Directions.north:
        direction = Directions.east;
        return _moveToNewPosition(x!, y! + 1);
      case Directions.east:
        direction = Directions.south;
        return _moveToNewPosition(x! + 1, y!);
      case Directions.south:
        direction = Directions.west;
        return _moveToNewPosition(x!, y! - 1);
      case Directions.west:
        direction = Directions.north;
        return _moveToNewPosition(x! - 1, y!);
    }
    return false;
  }

  bool _moveToNewPosition(int x, int y) {
    if (!_isAnObstacle(x, y)) {
      mars.removeRover(x, y);
      this.x = x;
      this.y = y;
      mars.saveRover(x, y, direction);
      return true;
    } else {
      mars.removeRover(x, y);
      mars.saveRover(x, y, direction);
      return false;
    }
  }

  bool _isAnObstacle(int x, int y) {
    if (x < 0 || x >= Mars.size || y < 0 || y >= Mars.size) {
      return true;
    }
    return mars.map[x][y] == MarsType.obstacle;
  }
}

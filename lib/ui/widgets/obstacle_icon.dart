import 'package:flutter/material.dart';

class ObstacleIcon extends StatelessWidget {
  const ObstacleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/obstacle_icon.jpg',
      fit: BoxFit.fill,
    );
  }
}

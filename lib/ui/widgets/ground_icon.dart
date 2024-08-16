import 'package:flutter/material.dart';

class GroundIcon extends StatelessWidget {
  const GroundIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ground_icon.jpg',
      fit: BoxFit.fill,
    );
  }
}

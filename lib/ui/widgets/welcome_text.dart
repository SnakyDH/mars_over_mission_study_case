import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.appText,
    required this.appColors,
  });

  final TextTheme appText;
  final ColorScheme appColors;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Welcome to Mars Rover",
        style: appText.headlineLarge,
        children: [
          TextSpan(
            text: "\nMission",
            style: TextStyle(
              color: appColors.primary,
              fontSize: appText.headlineLarge?.fontSize,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

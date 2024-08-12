import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mars_rover_mission/config/router/app_routes_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).textTheme;
    final appColors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wallpaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        appBar: AppBar(
          title: const Text("Mars Rover Mission"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/gif/rover.gif",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text.rich(
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
              ),
              const SizedBox(height: 40),
              Text(
                "You want to be part of the team that explores Mars by sending remote-controlled vehicles to the planet's surface?",
                style: appText.titleLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          tooltip: "Yes, I want to be part of the team",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () => context.pushNamed(AppRoutesName.registerScreen),
          backgroundColor: appColors.primaryContainer.withOpacity(0.2),
          label: Row(
            children: [
              Text(
                "YES",
                style: TextStyle(
                  color: appColors.onPrimaryContainer,
                  fontSize: appText.bodyLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

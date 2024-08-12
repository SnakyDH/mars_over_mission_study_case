import 'package:flutter/material.dart';
import 'package:mars_rover_mission/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mars Rover Mission',
      routerConfig: appRouter,
    );
  }
}

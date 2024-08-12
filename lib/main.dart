import 'package:flutter/material.dart';
import 'package:mars_rover_mission/config/router/app_router.dart';
import 'package:mars_rover_mission/config/theme/app_theme.dart';
import 'package:mars_rover_mission/config/theme/theme_util.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Raleway", "Space Mono");
    final theme = AppTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mars Rover Mission',
      theme: theme.dark(),
      routerConfig: appRouter,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/config/router/app_router.dart';
import 'package:mars_rover_mission/config/theme/app_theme.dart';
import 'package:mars_rover_mission/config/theme/theme_util.dart';
import 'package:mars_rover_mission/ui/blocs/game_set_up/game_set_up_bloc.dart';
import 'package:mars_rover_mission/ui/blocs/username/username_bloc.dart';

void main() {
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsernameBloc()),
        BlocProvider(create: (_) => GameSetUpBloc()),
      ],
      child: const MainApp(),
    );
  }
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

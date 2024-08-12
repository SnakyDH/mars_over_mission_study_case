import 'package:go_router/go_router.dart';
import 'package:mars_rover_mission/ui/screens/game_screen.dart';
import 'package:mars_rover_mission/ui/screens/home_screen.dart';
import 'package:mars_rover_mission/ui/screens/onboarding_screen.dart';
import 'package:mars_rover_mission/ui/screens/register_screen.dart';
import './app_routes_name.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: AppRoutesName.onboardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/register',
      name: AppRoutesName.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      name: AppRoutesName.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/game',
      name: AppRoutesName.gameScreen,
      builder: (context, state) => const GameScreen(),
    ),
  ],
);

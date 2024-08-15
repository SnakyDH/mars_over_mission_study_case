import 'package:flutter/material.dart';
import 'package:mars_rover_mission/ui/widgets/app_bar_user.dart';

class ScaffoldUsernameAppBarLayout extends StatelessWidget {
  final Widget child;
  const ScaffoldUsernameAppBarLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarUser(),
      body: child,
    );
  }
}

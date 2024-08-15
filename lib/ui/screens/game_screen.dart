import 'package:flutter/material.dart';
import 'package:mars_rover_mission/ui/layout/scaffold_username_app_bar_layout.dart';
import 'package:mars_rover_mission/ui/widgets/movement_controller.dart';
import 'package:mars_rover_mission/ui/widgets/selected_container.dart';
import 'package:mars_rover_mission/ui/widgets/standard_separator.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textApp = Theme.of(context).textTheme;
    return ScaffoldUsernameAppBarLayout(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Mars',
                textAlign: TextAlign.center,
                style: textApp.headlineLarge,
              ),
              const StandardSeparator(),
              const Expanded(
                child: Text("Mars Map"),
              ),
              const StandardSeparator(),
              const SelectedContainer(text: "FFRRFFFRL"),
              const StandardSeparator(),
              MovementController(),
              const StandardSeparator(),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text("Send Movement"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

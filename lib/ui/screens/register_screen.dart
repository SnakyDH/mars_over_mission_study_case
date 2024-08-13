import 'package:flutter/material.dart';
import 'package:mars_rover_mission/ui/layout/background_layout.dart';
import 'package:mars_rover_mission/ui/widgets/name_text_field.dart';
import 'package:mars_rover_mission/ui/widgets/standard_separator.dart';
import 'package:mars_rover_mission/ui/widgets/welcome_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).textTheme;
    final appColors = Theme.of(context).colorScheme;
    return BackgroundLayout(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WelcomeText(
                appText: appText,
                appColors: appColors,
              ),
              const StandardSeparator(),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return const SizedBox(
                      width: 400,
                      child: NameInput(),
                    );
                  }
                  return SizedBox(
                    width: constraints.maxWidth * 0.8,
                    child: const NameInput(),
                  );
                },
              ),
              const StandardSeparator(),
              FilledButton.icon(
                onPressed: () {
                  // todo: implement Name Bloc
                },
                icon: const Icon(Icons.rocket_launch),
                label: const Text("Start Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

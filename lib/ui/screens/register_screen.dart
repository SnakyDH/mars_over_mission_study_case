import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mars_rover_mission/config/router/app_routes_name.dart';
import 'package:mars_rover_mission/ui/blocs/bloc/username_bloc.dart';
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
    return BlocBuilder<UsernameBloc, UsernameState>(
      builder: (context, state) {
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
                  Text(
                    state.username.isNotEmpty ? "Hello, ${state.username}" : "",
                    style: TextStyle(
                      color: appColors.tertiary,
                      fontSize: appText.headlineLarge!.fontSize,
                      fontFamily: appText.headlineLarge!.fontFamily,
                    ),
                  ),
                  const StandardSeparator(),
                  FilledButton.icon(
                    onPressed: () => context.goNamed(AppRoutesName.homeScreen),
                    icon: const Icon(Icons.rocket_launch),
                    label: const Text("Start Now"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

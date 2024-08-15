import 'package:flutter/material.dart';
import 'package:mars_rover_mission/ui/widgets/app_bar_user.dart';
import 'package:mars_rover_mission/ui/widgets/direction_controller.dart';
import 'package:mars_rover_mission/ui/widgets/standard_separator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const AppBarUser(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Send initial position:',
              style: appText.titleLarge,
            ),
            const StandardSeparator(),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PositionInput(
                    label: "X",
                    onChanged: (value) {},
                  ),
                  PositionInput(
                    label: "Y",
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const StandardSeparator(),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  "Select direction",
                  style: appText.headlineMedium,
                ),
              ),
            ),
            const StandardSeparator(),
            DirectionController(),
            const StandardSeparator(),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start Game"),
            )
          ],
        ),
      ),
    );
  }
}

class PositionInput extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const PositionInput({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 100,
        child: TextFormField(
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: label,
          ),
        ),
      ),
      const SizedBox(height: 5),
    ]);
  }
}



  /* String? validator(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return 'Please enter a number';
    }
    if (int.parse(value) < 0) {
      return 'Please enter a positive number';
    }
    if (int.parse(value) > 200) {
      return 'Please enter a number between 0 and 200';
    }
    return null;
  } */
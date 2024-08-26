import 'package:flutter/material.dart';

class SelectedContainer extends StatelessWidget {
  final String text;
  const SelectedContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).textTheme;
    return Container(
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
          text,
          style: appText.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  const ControllerButton({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Colors.black.withOpacity(0.6),
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}

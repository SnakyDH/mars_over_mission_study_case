import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  final Widget child;
  const BackgroundLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wallpaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

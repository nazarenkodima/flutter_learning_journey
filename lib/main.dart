import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_11/home_screen.dart';

void main() {
  runApp(const FlutterLab());
}

class FlutterLab extends StatelessWidget {
  const FlutterLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}

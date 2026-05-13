import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_16/homework/main.dart';

void main() {
  runApp(const FlutterLab());
}

class FlutterLab extends StatelessWidget {
  const FlutterLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Lab',
      theme: ThemeData(fontFamily: 'SilpoText'),
    );
  }
}

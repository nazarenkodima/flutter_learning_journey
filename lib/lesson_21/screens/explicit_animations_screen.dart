import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatelessWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 21: Explicit Animations'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: ColoredBox(color: Colors.lightBlue.shade300),
              ),
              Expanded(
                flex: 3,
                child: ColoredBox(color: Colors.green.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

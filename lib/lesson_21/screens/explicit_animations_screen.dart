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
      body: const Center(child: Text('Create animation')),
    );
  }
}

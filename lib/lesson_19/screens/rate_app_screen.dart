import 'package:flutter/material.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA5E0FF),
      appBar: AppBar(
        title: const Text('Flutter lab'),
        backgroundColor: const Color(0xFF1B3D70),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('TODO: rating app')),
    );
  }
}

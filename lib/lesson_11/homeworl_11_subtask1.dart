import 'package:flutter/material.dart';

class SubtaskOne extends StatelessWidget {
  const SubtaskOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(47, 0, 46, 0),
          child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF096EEA),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

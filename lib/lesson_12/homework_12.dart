import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оцінка візиту до магазину'),
        leading: Icon(
          Icons.chevron_left,
          size: 24,
          color: Colors.grey.shade600,
        ),

        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Image.asset('assets/images/rating_empty.png', width: 48),
      ),
      backgroundColor: const Color(0xFFEEF2FC),
    );
  }
}

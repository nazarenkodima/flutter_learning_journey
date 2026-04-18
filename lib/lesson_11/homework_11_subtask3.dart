import 'package:flutter/material.dart';

class SubtaskThree extends StatelessWidget {
  const SubtaskThree({super.key});

  static const _star = Icon(Icons.star, color: Color(0xFFFFFD71));

  static Widget _card({required Color color}) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 10,
              children: [
                _star,
                const Text(
                  'Привіт, Flutter!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                _star,
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(47, 0, 46, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              _card(color: const Color(0xFF096EEA)),
              _card(color: const Color(0xFF08E900)),
              _card(color: const Color(0xFFEA090C)),
            ],
          ),
        ),
      ),
    );
  }
}

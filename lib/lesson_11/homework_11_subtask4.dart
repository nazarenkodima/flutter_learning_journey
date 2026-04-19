import 'package:flutter/material.dart';

class SubtaskFour extends StatelessWidget {
  const SubtaskFour({super.key});

  static const _star = Icon(Icons.star, color: Color(0xFFFFFD71));

  static Widget _card({required Color color, required Alignment alignment}) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: alignment,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              _star,
              Text(
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(47, 0, 46, 0),
        child: SizedBox(
          height: 659,

          child: Center(
            child: Column(
              spacing: 8,
              children: [
                Expanded(
                  child: _card(
                    color: const Color(0xFF096EEA),
                    alignment: Alignment.topLeft,
                  ),
                ),
                _card(
                  color: const Color(0xFF08E900),
                  alignment: Alignment.center,
                ),
                _card(
                  color: const Color(0xFFEA090C),
                  alignment: Alignment.bottomRight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

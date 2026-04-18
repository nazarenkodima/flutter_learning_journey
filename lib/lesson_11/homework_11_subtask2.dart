import 'package:flutter/material.dart';

class SubtaskTwo extends StatelessWidget {
  const SubtaskTwo({super.key});

  static const _star = Icon(Icons.star, color: Color(0xFFFFFD71));

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
              borderRadius: .circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: .end,
                children: [
                  const Row(
                    mainAxisAlignment: .end,
                    spacing: 10,
                    children: [
                      _star,
                      Text(
                        'Привіт, Flutter!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: .bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      _star,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

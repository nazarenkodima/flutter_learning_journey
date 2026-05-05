import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.active, required this.onTap});

  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        active
            ? 'assets/images/rating_filled.png'
            : 'assets/images/rating_empty.png',
        width: 48,
        height: 48,
      ),
    );
  }
}

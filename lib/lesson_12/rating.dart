import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating, required this.onChanged});

  final int rating;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (i) {
          final active = i < rating;

          return GestureDetector(
            onTap: () => onChanged(i + 1),
            child: active
                ? Image.asset(
                    'assets/images/rating_filled.png',
                    width: 48,
                    height: 48,
                  )
                : Image.asset(
                    'assets/images/rating_empty.png',
                    width: 48,
                    height: 48,
                  ),
          );
        }),
      ),
    );
  }
}

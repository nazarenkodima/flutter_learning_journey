import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_12/rating.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key, required this.rating, required this.onChanged});

  final int rating;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [BoxShadow(color: Color(0x0F000000), offset: Offset(0, 1))],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (i) => Rating(active: i < rating, onTap: () => onChanged(i + 1)),
          ),
        ),
      ),
    );
  }
}

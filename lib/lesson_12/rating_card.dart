import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key, required this.rating, required this.onChanged});

  final int rating;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 600),
      padding: .all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            offset: Offset(0, 1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: List.generate(
          5,
          (i) => GestureDetector(
            onTap: () => {onChanged(i + 1)},
            child: rating >= i + 1
                ? Image.asset('assets/images/rating_filled.png', width: 58)
                : Image.asset('assets/images/rating_empty.png', width: 48),
          ),
        ),
      ),
    );
  }
}

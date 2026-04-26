import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_12/department_card.dart';

class ServiceRating extends StatelessWidget {
  const ServiceRating({
    super.key,
    required this.label,
    required this.vote,
    required this.onChanged,
  });

  final String label;
  final Vote vote;
  final ValueChanged<Vote> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: .w400),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(Vote.down),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: vote == Vote.down
                    ? const Color(0xFF2358D1)
                    : const Color(0xFFE5E9F2),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                vote == Vote.down
                    ? Icons.thumb_down_alt
                    : Icons.thumb_down_alt_outlined,
                size: 20,
                color: vote == Vote.down ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => onChanged(Vote.up),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: vote == Vote.up
                    ? const Color(0xFF2358D1)
                    : const Color(0xFFE5E9F2),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                vote == Vote.up ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                size: 20,
                color: vote == Vote.up ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

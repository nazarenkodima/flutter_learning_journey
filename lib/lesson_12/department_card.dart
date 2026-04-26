import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_12/service_rating.dart';

enum Vote { none, down, up }

class Department {
  Department({
    required this.title,
    required this.items,
    required this.votes,
    required this.commentController,
  });

  final String title;
  final List<String> items;
  final List<Vote> votes;
  final TextEditingController commentController;
}

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({
    super.key,
    required this.department,
    required this.onVoteChanged,
  });

  final Department department;
  final void Function(int index, Vote vote) onVoteChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              department.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          for (var i = 0; i < department.items.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ServiceRating(
                label: department.items[i],
                vote: department.votes[i],
                onChanged: (vote) => onVoteChanged(i, vote),
              ),
            ),
          TextField(
            controller: department.commentController,
            decoration: InputDecoration(
              hintText: 'Розкажіть докладніше',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0x3D202124)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

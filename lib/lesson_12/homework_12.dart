import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_12/department_card.dart';
import 'package:flutter_learning_journey/lesson_12/rating_card.dart';
import 'package:flutter_learning_journey/lesson_12/section_title.dart';
import 'package:flutter_learning_journey/lesson_12/button.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

//
class _FormsState extends State<Forms> {
  int _rating = 0;
  final feedbackController = TextEditingController();

  final List<Department> _departments = [
    Department(
      title: 'Випічка',
      items: ['Обслуговування', 'Асортимент'],
      votes: [Vote.none, Vote.none],
      commentController: TextEditingController(),
    ),
    Department(
      title: 'Лавка традицій',
      items: ['Обслуговування', 'Асортимент'],
      votes: [Vote.none, Vote.none],
      commentController: TextEditingController(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Оцінка візиту до магазину',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: .stretch,
          children: [
            RatingCard(
              rating: _rating,
              onChanged: (value) => setState(() {
                _rating = value;
              }),
            ),
            SectionTitle(title: 'Яку оціночку поставите відділам?'),
            ..._departments.map((department) {
              return DepartmentCard(
                department: department,
                onVoteChanged: (index, vote) => setState(() {
                  department.votes[index] = vote;
                }),
              );
            }),
            SectionTitle(title: 'Є що додати?', position: .left),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 21),
        color: Colors.white,
        child: Button(
          onPressed: () {
            for (final department in _departments) {
              debugPrint(
                '${department.title}: votes=${department.votes}, comment=${department.commentController.text}',
              );
            }
            debugPrint('rating=$_rating');
          },
        ),
      ),
      backgroundColor: const Color(0xFFEEF2FC),
    );
  }
}

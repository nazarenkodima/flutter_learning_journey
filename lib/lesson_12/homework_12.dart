import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_12/department_card.dart';
import 'package:flutter_learning_journey/lesson_12/rating_card.dart';
import 'package:flutter_learning_journey/lesson_12/button.dart';
import 'package:flutter_learning_journey/lesson_12/comment_input.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

//
class _FormsState extends State<Forms> {
  int _rating = 0;
  late final TextEditingController feedbackController;
  late final List<Department> _departments;

  @override
  void initState() {
    super.initState();
    feedbackController = TextEditingController();
    _departments = [
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
  }

  @override
  void dispose() {
    feedbackController.dispose();
    for (final department in _departments) {
      department.commentController.dispose();
    }
    super.dispose();
  }

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
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                child: Text(
                  'Яку оціночку поставите відділам?',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
            ..._departments.map((department) {
              return DepartmentCard(
                department: department,
                onVoteChanged: (index, vote) => setState(() {
                  department.votes[index] = vote;
                }),
              );
            }),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Є що додати?',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommentInput(
                controller: feedbackController,
                hintText: 'Поділіться загальним враженням',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 21),
        color: Colors.white,
        child: Button(
          onPressed: () {
            for (final department in _departments) {
              if (_rating == 0) {
                if (_rating == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Додайте хоч якийсь рейтинг 🤔'),
                      backgroundColor: Colors.black,
                    ),
                  );
                }
                return;
              }

              final notVoted = _departments
                  .where((deprarment) => deprarment.votes.contains(Vote.none))
                  .map((deprarment) => deprarment.title)
                  .toList();

              if (notVoted.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Не оцінено: ${notVoted.join(', ')} 🍩'),
                    backgroundColor: Colors.black,
                  ),
                );
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Дякуємо за відгук! 🙌'),
                  backgroundColor: Colors.black,
                ),
              );

              debugPrint(
                '${department.title}: votes=${department.votes}, comment=${department.commentController.text}',
              );
            }
            debugPrint('rating=$_rating');
            debugPrint('feedback=${feedbackController.text}');
          },
        ),
      ),
      backgroundColor: const Color(0xFFEEF2FC),
    );
  }
}

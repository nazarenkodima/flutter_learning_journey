import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/lesson_11/homework_11_subtask2.dart';
import 'package:flutter_learning_journey/lesson_11/homework_11_subtask1.dart';
import 'package:flutter_learning_journey/lesson_11/homework_11_subtask3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const _icons = [
    Icons.looks_one,
    Icons.looks_two,
    Icons.looks_3,
    Icons.looks_4,
    Icons.looks_5,
  ];

  static const _listLenght = 5;

  final List<Widget> _screens = List.generate(
    _listLenght,
    (index) => switch (index) {
      0 => const SubtaskOne(),
      1 => const SubtaskTwo(),
      2 => const SubtaskThree(),
      _ => Center(child: Text('Subtask ${index + 1}')),
    },
  );

  final List<BottomNavigationBarItem> _items = List.generate(
    _listLenght,
    (index) => BottomNavigationBarItem(
      icon: Icon(_icons[index]),
      label: '${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      appBar: AppBar(
        title: Center(
          child: Text(
            'Subtask ${_selectedIndex + 1}',
            style: TextStyle(fontWeight: .bold),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: _items,
      ),
    );
  }
}

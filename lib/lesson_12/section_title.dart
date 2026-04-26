import 'package:flutter/material.dart';

enum Position { center, left }

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.position = Position.center,
  });

  final Position position;
  final String title;

  @override
  Widget build(BuildContext context) {
    final align = switch (position) {
      Position.center => Alignment.center,
      Position.left => Alignment.centerLeft,
    };

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: align,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SubtaskFive extends StatelessWidget {
  const SubtaskFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(47, 0, 46, 0),
        child: Center(
          child: Column(
            spacing: 8,
            children: const [
              Expanded(
                child: _Card(
                  color: Color(0xFF096EEA),
                  activeColor: Color(0xFF0756B8),
                  alignment: Alignment.topLeft,
                ),
              ),
              _Card(
                color: Color(0xFF08E900),
                activeColor: Color(0xFF06B800),
                alignment: Alignment.center,
              ),
              _Card(
                color: Color(0xFFEA090C),
                activeColor: Color(0xFFB8070A),
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Card extends StatefulWidget {
  const _Card({
    required this.color,
    required this.alignment,
    required this.activeColor,
  });

  final Color color;
  final Color activeColor;
  final Alignment alignment;

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool _isActive = false;

  Icon get _star => Icon(
    _isActive ? Icons.star : Icons.star_border,
    color: const Color(0xFFFFFD71),
  );

  void _toggle() => setState(() => _isActive = !_isActive);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: _isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ]
              : null,
          color: _isActive ? widget.activeColor : widget.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: widget.alignment,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                _star,
                const Text(
                  'Привіт, Flutter!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                _star,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

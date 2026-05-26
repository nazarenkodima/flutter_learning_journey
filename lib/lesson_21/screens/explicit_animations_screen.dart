import 'dart:math';

import 'package:flutter/material.dart';

const _oneTurn = 2 * pi;
const animationDuration = 2000;
const bounceHeight = 500.0;

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ballController;
  late final Animation<double> _bounceAnim;
  late final Animation<double> _rotateAnim;

  @override
  void initState() {
    super.initState();

    _ballController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: animationDuration),
    );

    _bounceAnim = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -bounceHeight,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 2,
      ),
      TweenSequenceItem(tween: ConstantTween(-bounceHeight), weight: 0.1),
      TweenSequenceItem(
        tween: Tween(
          begin: -bounceHeight,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 4,
      ),
    ]).animate(_ballController);

    _rotateAnim = Tween<double>(
      begin: 0,
      end: _oneTurn,
    ).animate(_ballController);
  }

  void _onBallTap() {
    _ballController.forward(from: 0);
  }

  @override
  void dispose() {
    _ballController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 21: Explicit Animations'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: ColoredBox(
              color: Colors.lightBlue.shade300,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedBuilder(
                  animation: _ballController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _bounceAnim.value),
                      child: Transform.rotate(
                        angle: _rotateAnim.value,
                        child: child,
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: _onBallTap,
                    child: Transform.translate(
                      offset: const Offset(0, 5),
                      child: Image.asset(
                        'assets/images/ball.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 3, child: ColoredBox(color: Colors.green.shade600)),
        ],
      ),
    );
  }
}

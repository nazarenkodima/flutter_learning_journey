import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/features/screens/home_screen.dart';
import 'package:flutter_learning_journey/lesson_11/homework_11_screen.dart';
import 'package:flutter_learning_journey/lesson_12/homework_12.dart';
import 'package:flutter_learning_journey/lesson_13/homework_13.dart';
import 'package:flutter_learning_journey/router/routes_names.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.home,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: '/lesson-11',
          name: RouteNames.lesson11,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const Lesson11Screen(),
            transitionsBuilder: (context, animation, _, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/lesson-12',
          name: RouteNames.forms,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const Forms(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.5, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutBack,
                    ),
                  ),
                  child: child,
                ),
              );
            },
          ),
        ),
        GoRoute(
          path: '/lesson-13',
          name: RouteNames.widgetConstraints,
          builder: (context, state) => WidgetConstrainsTrainingScreen(),
        ),
      ],
    ),
  ],
);

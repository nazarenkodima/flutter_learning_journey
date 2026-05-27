import 'package:flutter/material.dart';
import 'package:flutter_learning_journey/features/screens/home_screen.dart';
import 'package:flutter_learning_journey/lesson_11/homework_11_screen.dart';
import 'package:flutter_learning_journey/lesson_12/homework_12.dart';
import 'package:flutter_learning_journey/lesson_13/homework_13.dart';
import 'package:flutter_learning_journey/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_learning_journey/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:flutter_learning_journey/lesson_18/state_managment_base_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_19/screens/rate_app_screen.dart';
import 'package:flutter_learning_journey/lesson_22/error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:flutter_learning_journey/lesson_22/error_handling_homework/presentation/cubit/user_profile_cubit.dart';
import 'package:flutter_learning_journey/lesson_22/error_handling_homework/presentation/ui/screens/user_profile_homework_screen.dart';
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
          path: 'lesson-11',
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
          path: 'lesson-12',
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
          path: 'lesson-13',
          name: RouteNames.widgetConstraints,
          builder: (context, state) => WidgetConstrainsTrainingScreen(),
        ),
        GoRoute(
          path: 'lesson-18',
          name: RouteNames.lesson18,
          builder: (context, state) => const StateManagmentBaseScreen(),
          routes: [
            GoRoute(
              path: 'cubit',
              name: RouteNames.lesson18Cubit,
              builder: (context, state) => const HomeworkCubitScreen(),
            ),
            GoRoute(
              path: 'bloc',
              name: RouteNames.lesson18Bloc,
              builder: (context, state) => const HomeworkBlocScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'lesson-19',
          name: RouteNames.lesson19RateApp,
          builder: (context, state) => const RateAppScreen(),
        ),
        GoRoute(
          path: 'lesson-22',
          name: RouteNames.lesson22ErrorHandling,
          builder: (context, state) => BlocProvider(
            create: (_) =>
                UserProfileCubit(FakeUserRepository())..loadUserProfile(),
            child: const UserProfileHomeworkScreen(),
          ),
        ),
      ],
    ),
  ],
);

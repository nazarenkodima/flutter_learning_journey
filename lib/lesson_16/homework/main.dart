import 'package:flutter_learning_journey/features/screens/home_screen.dart';
import 'package:flutter_learning_journey/router/routes_names.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.home,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

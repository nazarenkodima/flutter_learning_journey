import 'package:flutter_learning_journey/features/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => HomeScreen()),
  ],
);

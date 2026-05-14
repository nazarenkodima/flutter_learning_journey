import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_learning_journey/lesson_18/homework_cubit/counter_cubit.dart';
import 'package:flutter_learning_journey/router/routes_names.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.purple.shade400,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _GlobalCountersPanel(),
            const SizedBox(height: 16),
            FeatureCard(
              title: 'Lesson 11',
              onTap: () => context.goNamed(RouteNames.lesson11),
            ),
            FeatureCard(
              title: 'Lesson 12',
              onTap: () => context.goNamed(RouteNames.forms),
            ),
            FeatureCard(
              title: 'Lesson 13',
              onTap: () => context.goNamed(RouteNames.widgetConstraints),
            ),
            FeatureCard(
              title: 'Lesson 18: State managment',
              onTap: () => context.goNamed(RouteNames.lesson18),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlobalCountersPanel extends StatelessWidget {
  const _GlobalCountersPanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.purple.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Global counters',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Cubit'),
                    BlocBuilder<CounterCubit, int>(
                      builder: (context, count) => Text(
                        '$count',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Bloc'),
                    BlocBuilder<CounterBloc, int>(
                      builder: (context, count) => Text(
                        '$count',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

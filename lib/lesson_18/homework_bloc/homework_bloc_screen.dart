import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_learning_journey/lesson_18/homework_bloc/counter_event.dart';

class HomeworkBlocScreen extends StatelessWidget {
  const HomeworkBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _HomeworkBlocView(),
    );
  }
}

class _HomeworkBlocView extends StatelessWidget {
  const _HomeworkBlocView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) => Text(
                '$count',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'bloc_decrement',
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterDecremented()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'bloc_increment',
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterIncremented()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

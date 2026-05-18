import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_16/homework/main.dart';
import 'package:flutter_learning_journey/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_learning_journey/lesson_18/homework_cubit/counter_cubit.dart';

void main() {
  runApp(const FlutterLab());
}

class FlutterLab extends StatelessWidget {
  const FlutterLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Lab',
        theme: ThemeData(fontFamily: 'SilpoText'),
      ),
    );
  }
}

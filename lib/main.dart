import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_16/homework/main.dart';
import 'package:flutter_learning_journey/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_learning_journey/lesson_18/homework_cubit/counter_cubit.dart';
import 'package:flutter_learning_journey/lesson_19/bloc/rate_app_cubit.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init((options) {
    options.dsn =
        'https://ff6f5d3250dc291ec49d8e3c36fe9cf5@o4511455544344576.ingest.de.sentry.io/4511455547883600';
    options.autoInitializeNativeSdk = false;
    options.enableLogs = true;
  }, appRunner: () => runApp(const FlutterLab()));
}

class FlutterLab extends StatelessWidget {
  const FlutterLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => RateAppCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Lab',
        theme: ThemeData(fontFamily: 'SilpoText'),
      ),
    );
  }
}

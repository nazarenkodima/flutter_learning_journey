import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_25/data/entity/cheque_entity.dart';
import 'package:flutter_learning_journey/lesson_25/presentation/cubit/cheque_cubit.dart';
import 'package:flutter_learning_journey/lesson_25/presentation/cubit/cheque_state.dart';

class JsonParsingScreen extends StatelessWidget {
  const JsonParsingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [Text('JSON Parsing'), Icon(Icons.data_object)],
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ChequeCubit, ChequeState>(
        builder: (context, state) {
          return switch (state) {
            ChequeLoading() => const Center(child: CircularProgressIndicator()),
            ChequeLoaded(json: final json) => _ChequeView(json),
            ChequeError() => Center(child: Text(state.message)),
          };
        },
      ),
    );
  }
}

class _ChequeView extends StatelessWidget {
  const _ChequeView(this.cheque);

  final ChequeEntity cheque;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Чек #${cheque.chequeId}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const Divider(),
        ...cheque.items.map((name) => Text('• $name')),
        const Divider(),
        Text('Передбачення: ${cheque.prediction}'),
        Text('Сума: ${cheque.totalAmount} грн'),
      ],
    );
  }
}

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

  static const _mono = TextStyle(fontFamily: 'monospace', fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFDF5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Image.asset('assets/images/silpo_logo.png', height: 50),
              Text(
                'Чек #${cheque.chequeId}',
                textAlign: TextAlign.center,
                style: _mono,
              ),
              const Divider(color: Colors.grey, thickness: 1),
              Text(
                'Ваша покупка',
                style: _mono.copyWith(fontWeight: FontWeight.bold),
              ),
              ...cheque.items.map((name) => Text(name, style: _mono)),
              const Divider(color: Colors.grey, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cума',
                    style: _mono.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${cheque.totalAmount} грн',
                    style: _mono.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1),
              Text(
                'Передбачення для вас:',
                textAlign: TextAlign.center,
                style: _mono.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '"${cheque.prediction}"',
                textAlign: TextAlign.center,
                style: _mono.copyWith(fontStyle: FontStyle.italic),
              ),
              Text(
                'Дякуємо за покупку! 🖤',
                textAlign: TextAlign.center,
                style: _mono,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

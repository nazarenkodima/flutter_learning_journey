import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_25/data/repository/cheque_repository.dart';
import 'package:flutter_learning_journey/lesson_25/presentation/cubit/cheque_state.dart';

class ChequeCubit extends Cubit<ChequeState> {
  ChequeCubit(this.repository) : super(ChequeLoading());

  final SilpoChequeRepository repository;

  Future<void> loadCheque() async {
    emit(ChequeLoading());

    try {
      final json = await repository.getCheque();
      emit(ChequeLoaded(json));
    } catch (_) {
      emit(ChequeError('Не вдалося завантажити чек'));
    }
  }
}

import 'package:flutter_learning_journey/lesson_25/data/entity/cheque_entity.dart';

sealed class ChequeState {}

final class ChequeLoading implements ChequeState {}

final class ChequeLoaded implements ChequeState {
  ChequeLoaded(this.json);

  final ChequeEntity json;
}

final class ChequeError implements ChequeState {
  ChequeError(this.message);

  final String message;
}

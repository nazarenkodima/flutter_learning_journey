import 'package:flutter_learning_journey/lesson_25/data/dto/cheque_dto.dart';

class ChequeEntity {
  ChequeEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  factory ChequeEntity.fromDto(ChequeDto dto) {
    return ChequeEntity(
      chequeId: dto.chequeHeader?.chequeId ?? 0,
      totalAmount: dto.chequeHeader?.sumReg ?? 0,
      prediction: dto.chPrediction ?? '',
      items:
          dto.chequeLines?.map((line) => line.lagerNameUa ?? '').toList() ?? [],
    );
  }

  final int chequeId;
  final double totalAmount;
  final List<String> items;
  final String prediction;
}

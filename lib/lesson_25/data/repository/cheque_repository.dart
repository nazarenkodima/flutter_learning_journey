import 'package:flutter_learning_journey/lesson_25/data/entity/cheque_entity.dart';
import 'package:flutter_learning_journey/lesson_25/data/source/cheque_source.dart';

class SilpoChequeRepository {
  SilpoChequeRepository(this._source);
  final ChequeSource _source;

  Future<ChequeEntity> getCheque() async {
    final dto = await _source.getChequeDto();

    return ChequeEntity.fromDto(dto);
  }
}

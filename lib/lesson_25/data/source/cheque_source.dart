import 'dart:convert';

import 'package:flutter_learning_journey/lesson_25/data/api/cheque_api.dart';
import 'package:flutter_learning_journey/lesson_25/data/dto/cheque_dto.dart';

class ChequeSource {
  ChequeSource(this._api);
  final ChequeApi _api;

  Future<ChequeDto> getChequeDto() async {
    final response = await _api.loadCheque();
    final jsonMap = jsonDecode(response) as Map<String, dynamic>;

    return ChequeDto.fromJson(jsonMap);
  }
}

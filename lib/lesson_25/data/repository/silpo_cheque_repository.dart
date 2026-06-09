import 'package:flutter/services.dart';

class SilpoChequeRepository {
  Future<String> getChequeJson() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return rootBundle.loadString('assets/json/silpo_cheque_example.json');
  }
}

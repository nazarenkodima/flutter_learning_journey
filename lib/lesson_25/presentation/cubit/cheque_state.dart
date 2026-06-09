sealed class ChequeState {}

final class ChequeLoading implements ChequeState {}

final class ChequeLoaded implements ChequeState {
  ChequeLoaded(this.json);

  final String json;
}

final class ChequeError implements ChequeState {
  ChequeError(this.message);

  final String message;
}

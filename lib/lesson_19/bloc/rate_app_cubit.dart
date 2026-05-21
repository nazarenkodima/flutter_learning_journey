import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RateAppStatus { initial, loading, success, error }

class RateAppState extends Equatable {
  final RateAppStatus status;
  final int rating;

  const RateAppState({
    this.status = RateAppStatus.initial,
    this.rating = 0,
  });

  RateAppState copyWith({RateAppStatus? status, int? rating}) {
    return RateAppState(
      status: status ?? this.status,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [status, rating];
}

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit() : super(const RateAppState());

  void setRating(int rating) {
    emit(state.copyWith(rating: rating));
  }

  void reset() {
    emit(const RateAppState());
  }

  Future<void> submit() async {
    emit(state.copyWith(status: RateAppStatus.loading));
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(status: RateAppStatus.success));
  }
}

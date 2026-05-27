import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_22/error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:flutter_learning_journey/lesson_22/error_handling_homework/presentation/cubit/user_profile_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repository) : super(UserProfileLoading());

  final FakeUserRepository repository;

  Future<void> loadUserProfile({bool shouldFail = true}) async {
    emit(UserProfileLoading());

    try {
      final user = await repository.getUserProfile(shouldFail);
      emit(UserProfileLoaded(user));
    } on CustomServerError catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      emit(UserProfileError(e.message));
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      emit(UserProfileError('Сталася непередбачена помилка'));
    }
  }
}

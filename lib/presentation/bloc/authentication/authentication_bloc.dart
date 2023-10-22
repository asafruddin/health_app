import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:health_app/domain/usecase/login_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase loginUseCase;

  AuthenticationBloc(this.loginUseCase) : super(AuthenticationState.initial()) {
    on<LoginEvent>(login);
  }

  Future<void> login(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.logingIn));
      await Future.delayed(const Duration(seconds: 1));
      final result = await loginUseCase.execute(event.email, event.password);
      emit(
          state.copyWith(token: result, loginStatus: LoginStatus.loginSucceed));
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        emit(state.copyWith(
            loginStatus: LoginStatus.loginFaild,
            errorMessage: e.response?.data['error'] ?? 'Error Unexpected'));
        return;
      }
      emit(state.copyWith(
          loginStatus: LoginStatus.loginFaild,
          errorMessage: e.response?.data['error'] ?? 'Error Unexpected'));
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.loginFaild, errorMessage: e.toString()));
    }
  }
}

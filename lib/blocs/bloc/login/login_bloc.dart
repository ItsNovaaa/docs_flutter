import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:fllutter_learn/repositories/login_repositories.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositories _loginRepository;

  // Dependency injection of repository
  LoginBloc(this._loginRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginInProgress());
      
      try {
        final token = await _loginRepository.login(
          event.email, 
          event.password
        );
        emit(LoginSuccess(token: token));
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
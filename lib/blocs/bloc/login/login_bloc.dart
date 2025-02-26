import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
// import 'package:dio/dio.dart';
import 'package:fllutter_learn/core/network/dio_client.dart';
import 'package:fllutter_learn/core/config/api_config.dart';
import 'package:fllutter_learn/model/login_validation_error.dart';
// import 'package:fllutter_learn/core/network/exeption/api_exeption.dart';
// import 'package:fllutter_learn/repositories/login_repositories.dart';
import 'package:fllutter_learn/model/login_response.dart';
import 'package:fllutter_learn/core/shared_preference/shared_preference.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DioClient _dioClient;

  LoginBloc(this._dioClient) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginInProgress());

      try {
        final response = await _dioClient.post(
          ApiConfig.loginEndpoint,
          data: {
            'email': event.email,
            'password': event.password,
          },
        );

        if (response.statusCode == 200) {
          final loginResponse = LoginResponse.fromJson(response.data);

          if (loginResponse.data?.token != null) {
            await TokenManager.saveToken(loginResponse.data!.token!);
            emit(LoginSuccess(token: loginResponse.data!.token!));
          } else {
            emit(const LoginFailure(error: 'Token not found in response'));
          }
        } else {
          emit(const LoginFailure(error: 'Invalid email or password'));
        }
       
      } catch (e) {
        if (e is DioException) {
          final loginValidationError =
              LoginValidationError.fromJson(e.response?.data);
          emit(LoginFailure(
              error: loginValidationError.message ?? 'Unknown error'));
        } else {
          emit(LoginFailure(error: 'Something went wrong'));
        }
        // emit(LoginFailure(error: 'Failed to login'));
      }
    }
    );

    on<DeleteToken>((event, emit) async {
      await TokenManager.deleteToken();
      emit(LoginInitial());
    });
  }
}
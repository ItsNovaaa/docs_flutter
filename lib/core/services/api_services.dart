import 'package:dio/dio.dart';
import 'package:fllutter_learn/core/config/api_config.dart';
import 'package:fllutter_learn/core/network/dio_client.dart';
import 'package:fllutter_learn/model/login_response.dart';
import 'package:fllutter_learn/core/shared_preference/shared_preference.dart';
class ApiService {
  final DioClient _dioClient;

  ApiService() : _dioClient = DioClient();

  Future<Response> getDocument() async {
    try {
      final response = await _dioClient.get(ApiConfig.documentEndpoint);
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unknown error occurred');
    }
  }
  // post method for login api
  Future<Response> postLogin(LoginResponse loginRequest) async {
    try {
      final response = await _dioClient.post(
        ApiConfig.loginEndpoint, 
        data: loginRequest.toJson()
      );
      if (response.data['token'] != null) {
        await TokenManager.saveToken(response.data['token']);
      }
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unknown error occurred');
    }
  }
}

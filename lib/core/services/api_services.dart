import 'package:dio/dio.dart';
import 'package:fllutter_learn/core/config/api_config.dart';
import 'package:fllutter_learn/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient;

  ApiService() : _dioClient = DioClient();

  Future<Response> getDocument() async {
    try {
      final response = await _dioClient.get(ApiConfig.documentEndpoint);
      return response;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception('Unknown error occurred');
    }
  }
}
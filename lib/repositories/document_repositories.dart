import 'package:dio/dio.dart';
import 'package:fllutter_learn/core/network/exeption/api_exeption.dart';
import 'package:fllutter_learn/core/services/api_services.dart';
import 'package:fllutter_learn/model/document_response.dart';

class DocumentRepositories {
  final ApiService _apiService;

  DocumentRepositories() : _apiService = ApiService();

  Future<DocumentResponse> fetchDocument({
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleApiCall(() async {
      final response = await _apiService.getDocument(queryParameters: queryParameters);
      return DocumentResponse.fromJson(response.data);
    });
  }

  Future<T> _handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on BadRequestException {
      throw Exception('Invalid request');
    } on UnauthorizedException {
      throw Exception('Access denied');
    } on NotFoundException {
      throw Exception('Resource not found');
    } on InternalServerErrorException {
      throw Exception('Internal server error');
    } on NoInternetConnectionException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Unknown error occurred');
    }
  }
}
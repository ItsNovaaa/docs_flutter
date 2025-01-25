

import 'package:fllutter_learn/core/network/exeption/api_exeption.dart';
import 'package:fllutter_learn/core/services/api_services.dart';
// import 'package:fllutter_learn/model/document_response.dart';
import 'package:fllutter_learn/model/login_response.dart';

class LoginRepositories {
  final ApiService _apiService;

  // Constructor with optional named parameter
  LoginRepositories({ApiService? apiService}) 
    : _apiService = apiService ?? ApiService();

  Future<String> login(String email, String password) async {
    final response = await _apiService.postLogin(
      LoginResponse(email: email, password: password)
    );
    
    // Extract token from response
    // Adjust based on actual API response structure
    final token = response.data['token'] ?? '';
    return token;
  }
}  Future<T> _handleApiCall<T>(Future<T> Function() apiCall) async {
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



// import 'package:fllutter_learn/core/network/exeption/api_exeption.dart';
// // import 'package:fllutter_learn/core/services/api_services.dart';
// // import 'package:fllutter_learn/model/document_response.dart';
// import 'package:fllutter_learn/core/network/dio_client.dart';
// import 'package:fllutter_learn/core/config/api_config.dart';
// import 'package:fllutter_learn/model/login_response.dart';

// class LoginRepositories {
//   final DioClient _dioClient = DioClient();

//     Future<LoginResponse> loginUser(String email, String password) async {
//     return _handleApiCall(() async {
//       final response = await _dioClient.post(
//         ApiConfig.loginEndpoint,
//         data: {'email': email, 'password': password},
//       );
//       return LoginResponse.fromJson(response.data);
//     });
//   }} 
//    Future<T> _handleApiCall<T>(Future<T> Function() apiCall) async {
//     try {
//       return await apiCall();
//     } on BadRequestException {
//       throw Exception('Invalid request');
//     } on UnauthorizedException {
//       throw Exception('Access denied');
//     } on NotFoundException {
//       throw Exception('Resource not found');
//     } on InternalServerErrorException {
//       throw Exception('Internal server error');
//     } on NoInternetConnectionException {
//       throw Exception('No internet connection');
//     } catch (e) {
//       throw Exception('Unknown error occurred');
//     }
//   }

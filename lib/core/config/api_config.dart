class ApiConfig {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  // static const String baseUrl = 'http://localhost:8000/api';

  // Api Endpoints
    static const String documentEndpoint = '/ocr-teseracts';
    
  // Api Timeout
    static const int connectTimeout = 50000;
    static const int receiveTimeout = 50000;

  // Api Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

}
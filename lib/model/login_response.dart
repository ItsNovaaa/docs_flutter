class LoginResponse {
  final String email;
  final String password;

  LoginResponse({
    required this.email, 
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
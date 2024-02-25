class ApiEndPoints {
  static const String baseUrl = "http://restapi.adequateshop.com";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String registerEmail = '/api/authaccount/registration';
  final String loginEmail = '/api/authaccount/login';
}

class RestApi {
  static final String baseUrl = 'https://localhost:4000/';
  static _AuthApi authApi = _AuthApi();
}

class _AuthApi {
  final String register = 'users/register';
  final String login = 'users/login';
  final String logout = 'users/logout';
  final String userInfo = 'users/user-profile';
}

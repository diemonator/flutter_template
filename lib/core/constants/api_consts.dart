sealed class ApiConsts {
  // Base Urls.
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String authBaseUrl = '$baseUrl/auth/';

  // Auth Parent.
  static const String emailLogin = 'email/login';
  static const String register = 'phone/register';

  // Auth Child.
  static const String emailLoginChild = 'email/child/login';
  static const String me = 'me';
}

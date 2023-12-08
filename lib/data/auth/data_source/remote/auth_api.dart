import '../../../../core/utils/network/api.dart';

class AuthApi {
  const AuthApi(this._authApi);

  final Api _authApi;

  Future<String> logIn() async {
    return 'token';
  }

  Future<bool> logOut() async {
    return true;
  }

  Future<String> refreshToken() async {
    return 'new_token';
  }
}

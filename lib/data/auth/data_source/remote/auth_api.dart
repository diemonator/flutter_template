import '../../../../app/utils/network/request_wrapper.dart';

class AuthApi {
  const AuthApi(this._authApi);

  final RequestWrapper _authApi;

  Future<String> logIn() async {
    return 'token';
  }

  Future<bool> logOut() async {
    return true;
  }
}

import 'package:result_dart/result_dart.dart';

import '../../../domain/auth/models/user_data/user_data.dart';
import '../../../domain/auth/models/user_type.dart';
import '../../../domain/auth/repositories/user_repo.dart';
import '../data_source/local/secure_local_storage.dart';
import '../data_source/remote/auth_api.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._secureLocalStorage, this._authApi);

  final SecureLocalStorage _secureLocalStorage;
  final AuthApi _authApi;
  UserData? _userData;

  @override
  UserData? get user => _userData;

  @override
  AsyncResult<Unit, String> saveUser({required UserData userData}) {
    _userData = userData;

    return _secureLocalStorage.saveUser(userData: userData);
  }

  @override
  AsyncResult<Unit, String> changeUserType({required UserData userData}) {
    return saveUser(userData: userData);
  }

  @override
  Future<bool> deleteUser() => _secureLocalStorage.deleteUser();

  @override
  AsyncResult<Unit, String> logIn(String email, String password) async {
    final token = await _authApi.logIn();

    final userData = UserData(
      email: email,
      pass: password,
      token: token,
      userType: UserType.user.name,
    );

    _userData = userData;

    return saveUser(userData: userData);
  }

  @override
  Future<void> loadUser() async {
    _userData = await _secureLocalStorage.getUser();
  }

  @override
  AsyncResult<Unit, String> logOut() async {
    _userData = null;
    final deletedUser = await _secureLocalStorage.deleteUser();
    final logOutUser = await _authApi.logOut();

    if (deletedUser && logOutUser) {
      return Success.unit();
    }

    return const Failure('Log out procedure failed');
  }
}

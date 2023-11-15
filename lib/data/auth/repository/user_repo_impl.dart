import 'package:result_dart/result_dart.dart';

import '../../../domain/auth/models/user_data/user_data.dart';
import '../../../domain/auth/models/user_type.dart';
import '../../../domain/auth/repositories/user_repo.dart';
import '../../../domain/exceptions/exception_handler.dart';
import '../../../domain/exceptions/user_exception.dart';
import '../data_source/local/auth_local_storage.dart';
import '../data_source/remote/auth_api.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._secureLocalStorage, this._authApi);

  final AuthLocalStorage _secureLocalStorage;
  final AuthApi _authApi;
  UserData _userData = UserData.empty();

  @override
  UserData get user => _userData;

  @override
  AsyncResult<Unit, UserSaveFailed> saveUser({
    required UserData userData,
  }) async {
    try {
      _userData = userData;
      await _secureLocalStorage.saveUser(userData: userData);

      return Success.unit();
    } on Exception catch (e, stackTrace) {
      e.logException(stackTrace);
    }

    return const Failure(UserSaveFailed());
  }

  @override
  AsyncResult<Unit, UserDeletionFailed> deleteUser() async {
    try {
      await _secureLocalStorage.deleteUser();

      return Success.unit();
    } on Exception catch (e, stackTrace) {
      e.logException(stackTrace);
    }

    return const Failure(UserDeletionFailed());
  }

  @override
  AsyncResult<Unit, UserLoginFailed> logIn(
    String email,
    String password,
  ) async {
    try {
      final token = await _authApi.logIn();
      final userData = UserData(
        email: email,
        pass: password,
        token: token,
        userType: UserType.user.name,
      );
      _userData = userData;

      await _secureLocalStorage.saveUser(userData: userData);

      return Success.unit();
    } on Exception catch (e, stackTrace) {
      e.logException(stackTrace);

      return const Failure(UserLoginFailed());
    }
  }

  @override
  Future<void> loadUser() async {
    _userData = await _secureLocalStorage.getUser();
  }

  @override
  AsyncResult<Unit, UserLogoutFailed> logOut() async {
    try {
      _userData = UserData.empty();
      final logOutUser = await _authApi.logOut();
      await _secureLocalStorage.deleteUser();

      if (logOutUser) {
        return Success.unit();
      }
    } on Exception catch (e, stackTrace) {
      e.logException(stackTrace);
    }

    return const Failure(UserLogoutFailed());
  }

  @override
  AsyncResult<Unit, UserRefreshTokenFailed> refreshToken() async {
    try {
      final token = await _authApi.logIn();
      final userData = _userData.copyWith(token: token);
      _userData = userData;

      await _secureLocalStorage.saveUser(userData: userData);

      return Success.unit();
    } on Exception catch (e, stackTrace) {
      e.logException(stackTrace);
    }

    return const Failure(UserRefreshTokenFailed());
  }
}

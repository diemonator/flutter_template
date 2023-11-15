import 'package:result_dart/result_dart.dart';

import '../../exceptions/user_exception.dart';
import '../models/user_data/user_data.dart';

abstract interface class UserRepo {
  UserData get user;

  Future<void> loadUser();

  AsyncResult<Unit, UserSaveFailed> saveUser({required UserData userData});

  AsyncResult<Unit, UserLoginFailed> logIn(String email, String password);

  AsyncResult<Unit, UserLogoutFailed> logOut();

  AsyncResult<Unit, UserDeletionFailed> deleteUser();

  AsyncResult<Unit, UserRefreshTokenFailed> refreshToken();
}

import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

import '../../exceptions/user_exception.dart';
import '../models/user_data/user_data.dart';
import '../repositories/user_repo.dart';

class Auth extends ChangeNotifier {
  Auth(this._userRepo);

  final UserRepo _userRepo;

  bool get isLoggedIn => _userRepo.user != UserData.empty();

  Future<void> Function() get initAuth => _userRepo.loadUser;

  Map<String, dynamic> get authHeader {
    if (isLoggedIn) {
      return {'Authorization': 'Bearer ${_userRepo.user.token}'};
    }

    throw const UserInitializationFailed();
  }

  AsyncResult<Unit, UserLoginFailed> logIn(String email, String password) {
    return _userRepo.logIn(email, password).onSuccess(
          (_) => notifyListeners(),
        );
  }

  AsyncResult<Unit, UserLogoutFailed> logOut() {
    return _userRepo.logOut().onSuccess(
          (_) => notifyListeners(),
        );
  }

  AsyncResult<Unit, UserRefreshTokenFailed> refreshToken() {
    return _userRepo.refreshToken();
  }
}

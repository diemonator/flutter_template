import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/user_repo.dart';

class Auth extends ChangeNotifier {
  Auth(this._userRepo);

  final UserRepo _userRepo;

  bool get isLoggedIn => _userRepo.user != null;

  Future<void> Function() get initAuth => _userRepo.loadUser;

  AsyncResult<Unit, String> logIn(String email, String password) {
    return _userRepo.logIn(email, password).onSuccess(
          (_) => notifyListeners(),
        );
  }

  AsyncResult<Unit, String> logOut() {
    return _userRepo.logOut().onSuccess(
          (_) => notifyListeners(),
        );
  }
}

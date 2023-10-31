import 'package:flutter/widgets.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void logIn() {
    if (!_isLoggedIn) {
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logOut() {
    if (_isLoggedIn) {
      _isLoggedIn = false;
      notifyListeners();
    }
  }
}

import 'package:regexed_validator/regexed_validator.dart';
import 'package:result_dart/result_dart.dart';

import '../../../app/utils/state_management/base_vm.dart';
import '../../../domain/auth/services/auth.dart';
import '../../../domain/exceptions/user_exception.dart';

final class LoginVM extends BaseVM {
  LoginVM(this._auth);

  String _email = '';
  String _password = '';
  final Auth _auth;

  AsyncResult<Unit, UserLoginFailed> logIn() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      return _auth.logIn(_email, _password);
    }

    return const Failure(UserLoginFailed());
  }

  bool emailValidator(String text) {
    final isValidEmail = validator.email(text);
    if (isValidEmail) {
      _email = text;
    }

    return isValidEmail;
  }

  bool passwordValidator(String text) {
    final isPassValid = validator.mediumPassword(text);
    if (isPassValid) {
      _password = text;
    }

    return isPassValid;
  }
}

import 'package:regexed_validator/regexed_validator.dart';
import 'package:result_dart/result_dart.dart';

import '../../../app/utils/state_management/base_vm.dart';
import '../../../domain/auth/services/auth.dart';

final class LoginVM extends BaseVM {
  LoginVM(this._auth);

  String _email = '';
  String _password = '';
  final Auth _auth;

  AsyncResult<Unit, String> logIn() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      return _auth.logIn(_email, _password);
    }

    return Future.value(Success.unit());
  }

  String? emailValidator(String text) {
    final result = validator.email(text);

    if (!result) {
      return 'Email is not valid';
    }
    _email = text;

    return null;
  }

  String? passwordValidator(String text) {
    final result = validator.mediumPassword(text);

    if (!result) {
      return 'Password is too week';
    }
    _password = text;

    return null;
  }
}

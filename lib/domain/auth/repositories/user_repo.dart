import 'package:result_dart/result_dart.dart';

import '../models/user_data/user_data.dart';

abstract interface class UserRepo {
  UserData? get user;

  Future<void> loadUser();

  AsyncResult<Unit, String> saveUser({required UserData userData});

  AsyncResult<Unit, String> logIn(String email, String password);

  AsyncResult<Unit, String> logOut();

  AsyncResult<Unit, String> changeUserType({required UserData userData});

  Future<bool> deleteUser();
}

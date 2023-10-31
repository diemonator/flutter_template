import 'package:result_dart/result_dart.dart';

import '../models/user_data/user_data.dart';

abstract interface class UserRepo {
  Result<UserData, Error> get user;

  AsyncResult<Unit, Error> saveUser({required UserData userData});

  AsyncResult<Unit, Error> changeUserType({required UserData userData});
}

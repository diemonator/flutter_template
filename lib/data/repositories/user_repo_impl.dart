import 'package:result_dart/result_dart.dart';

import '../../domain/models/user_data/user_data.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/local/secure_local_storage.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._secureLocalStorage, this._userData);

  final SecureLocalStorage _secureLocalStorage;
  UserData _userData;

  @override
  Result<UserData, Error> get user => Success(_userData);

  @override
  AsyncResult<Unit, Error> saveUser({required UserData userData}) {
    _userData = userData;

    return _secureLocalStorage.saveUser(userData: _userData);
  }

  @override
  AsyncResult<Unit, Error> changeUserType({required UserData userData}) =>
      saveUser(userData: userData);
}

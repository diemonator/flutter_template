import 'dart:convert';

import '../../../../core/constants/consts.dart';
import '../../../../core/utils/local_storages/secure_local_storage.dart';
import '../../../../domain/auth/models/user_data/user_data.dart';
import '../../../../domain/exceptions/general_exceptions/json_mapping_exception.dart';

class AuthLocalStorage {
  const AuthLocalStorage(this._secureStorage);

  final SecureLocalStorage _secureStorage;

  Future<void> saveUser({required UserData userData}) {
    try {
      final json = jsonEncode(userData.toJson());

      return _secureStorage.write(Consts.user, json);
    } on FormatException catch (e, stackTrace) {
      Error.throwWithStackTrace(const JsonMappingException(), stackTrace);
    }
  }

  Future<void> deleteUser() => _secureStorage.delete(Consts.user);

  Future<UserData> getUser() async {
    try {
      final userJson = await _secureStorage.read(Consts.user) ?? '';

      if (userJson.isNotEmpty) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;

        return UserData.fromJson(userMap);
      }
    } on FormatException {
      await _secureStorage.delete(Consts.user);
    }

    return UserData.empty();
  }
}

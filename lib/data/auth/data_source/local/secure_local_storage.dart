import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../app/constants/consts.dart';
import '../../../../domain/auth/models/user_data/user_data.dart';

class SecureLocalStorage {
  const SecureLocalStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  AsyncResult<Unit, Error> saveUser({required UserData userData}) async {
    final json = jsonEncode(userData.toJson());

    try {
      await _secureStorage.write(key: Consts.user, value: json);

      return Success.unit();
    } on PlatformException {
      return Failure(Error());
    }
  }

  Future<UserData> getUser() async {
    final json = await _secureStorage.read(key: Consts.user);

    if (json != null) {
      final map = jsonDecode(json) as Map<String, dynamic>;

      return UserData.fromJson(map);
    }

    return UserData.guest();
  }
}

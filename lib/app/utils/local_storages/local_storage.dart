import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/exceptions/general_exceptions/io_storage_exception.dart';

final class LocalStorage {
  const LocalStorage(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  String? getString(String key) {
    try {
      return _sharedPreferences.getString(key);
    } on PlatformException catch (e, stackTrace) {
      Error.throwWithStackTrace(const IOStorageException(), stackTrace);
    }
  }

  Future<bool> deleteString(String key) {
    try {
      return _sharedPreferences.remove(key);
    } on PlatformException catch (e, stackTrace) {
      Error.throwWithStackTrace(const IOStorageException(), stackTrace);
    }
  }

  Future<bool> setString(String key, String value) {
    try {
      return _sharedPreferences.setString(key, value);
    } on PlatformException catch (e, stackTrace) {
      Error.throwWithStackTrace(const IOStorageException(), stackTrace);
    }
  }
}

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/exceptions/general_exceptions/io_storage_exception.dart';

final class SecureLocalStorage {
  const SecureLocalStorage(this._flutterSecureStorage);

  final FlutterSecureStorage _flutterSecureStorage;

  Future<String?> read(String key) {
    try {
      return _flutterSecureStorage.read(key: key);
    } on PlatformException catch (e, stackTrace) {
      Error.throwWithStackTrace(const IOStorageException(), stackTrace);
    }
  }

  Future<void> write(String key, String value) {
    try {
      return _flutterSecureStorage.write(key: key, value: value);
    } on PlatformException catch (e, stackTrace) {
      Error.throwWithStackTrace(const IOStorageException(), stackTrace);
    }
  }

  Future<void> delete(String key) {
    try {
      return _flutterSecureStorage.delete(key: key);
    } on PlatformException catch (e, stackTrace) {
      Error.throwWithStackTrace(const IOStorageException(), stackTrace);
    }
  }
}

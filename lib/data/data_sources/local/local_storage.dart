import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/constants/consts.dart';
import '../../../domain/models/locale_data.dart';
import '../../../domain/models/theme_state.dart';
import '../../../domain/models/user_settings/user_settings.dart';

final class LocalStorage {
  const LocalStorage(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  ThemeState get themeState => userSettings.themeState;

  LocaleData get localeData => userSettings.localeDate;

  AsyncResult<Unit, Exception> saveUserSettings({
    required UserSettings userSettings,
  }) async {
    final json = jsonEncode(userSettings);

    try {
      await _sharedPreferences.setString(Consts.userSettings, json);

      return Success.unit();
    } on PlatformException {
      return Failure(Exception());
    }
  }

  UserSettings get userSettings {
    final userData = _sharedPreferences.getString(Consts.userSettings);

    if (userData != null) {
      final map = jsonDecode(userData) as Map<String, dynamic>;

      return UserSettings.fromJson(map);
    }

    return UserSettings.empty();
  }
}

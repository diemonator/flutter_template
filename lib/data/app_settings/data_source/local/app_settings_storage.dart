import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/constants/consts.dart';
import '../../../../domain/app_settings/models/app_settings/app_settings.dart';
import '../../../../domain/app_settings/models/locale_data.dart';
import '../../../../domain/app_settings/models/theme_state.dart';

final class AppSettingsStorage {
  const AppSettingsStorage(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  ThemeState get themeState => appSettings.themeState;

  LocaleData get localeData => appSettings.localeDate;

  AsyncResult<Unit, String> saveAppSettings({
    required AppSettings appSettings,
  }) async {
    try {
      final json = jsonEncode(appSettings);
      await _sharedPreferences.setString(Consts.appSettings, json);

      return Success.unit();
    } on PlatformException {
      return const Failure("Couldn't save settings");
    }
  }

  AppSettings get appSettings {
    final userData = _sharedPreferences.getString(Consts.appSettings);

    if (userData != null) {
      final map = jsonDecode(userData) as Map<String, dynamic>;

      return AppSettings.fromJson(map);
    }

    return AppSettings.empty();
  }
}

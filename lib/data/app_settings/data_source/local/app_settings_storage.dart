import 'dart:convert';

import '../../../../app/constants/consts.dart';
import '../../../../app/utils/local_storages/local_storage.dart';
import '../../../../domain/app_settings/models/app_settings/app_settings.dart';
import '../../../../domain/app_settings/models/locale_data.dart';
import '../../../../domain/app_settings/models/theme_state.dart';
import '../../../../domain/exceptions/general_exceptions/json_mapping_exception.dart';

final class AppSettingsStorage {
  const AppSettingsStorage(this._localStorage);

  final LocalStorage _localStorage;

  ThemeState get themeState => appSettings.themeState;

  LocaleData get localeData => appSettings.localeDate;

  AppSettings get appSettings {
    try {
      final jsonText = _localStorage.getString(Consts.appSettings) ?? '';

      if (jsonText.isNotEmpty) {
        final json = jsonDecode(jsonText) as Map<String, dynamic>;

        return AppSettings.fromJson(json);
      }
    } on FormatException {
      _localStorage.deleteString(Consts.appSettings);
    }

    return AppSettings.empty();
  }

  Future<bool> saveAppSettings({required AppSettings appSettings}) {
    try {
      final json = appSettings.toJson();
      final jsonText = jsonEncode(json);

      return _localStorage.setString(Consts.appSettings, jsonText);
    } on FormatException catch (e, stackTrace) {
      Error.throwWithStackTrace(const JsonMappingException(), stackTrace);
    }
  }
}

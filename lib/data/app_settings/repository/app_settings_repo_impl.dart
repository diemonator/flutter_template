import 'package:result_dart/result_dart.dart';

import '../../../domain/app_settings/models/app_settings/app_settings.dart';
import '../../../domain/app_settings/models/locale_data.dart';
import '../../../domain/app_settings/models/theme_state.dart';
import '../../../domain/app_settings/repositories/locale_settings_repo.dart';
import '../../../domain/app_settings/repositories/theme_settings_repo.dart';
import '../data_source/local/app_settings_storage.dart';

class AppSettingsRepoImpl implements ThemeSettingsRepo, LocaleSettingsRepo {
  AppSettingsRepoImpl(
    this._localStorage,
  ) : _appSettings = _localStorage.appSettings;

  final AppSettingsStorage _localStorage;
  AppSettings _appSettings;

  @override
  LocaleData get locale => _localStorage.localeData;

  @override
  ThemeState get themeState => _localStorage.themeState;

  @override
  AsyncResult<Unit, Exception> saveLocale({required LocaleData localeData}) {
    _appSettings = _appSettings.copyWith(
      languageCode: localeData.languageCode,
      countryCode: localeData.countryCode,
      scriptCode: localeData.scriptCode,
    );

    return _localStorage.saveAppSettings(appSettings: _appSettings);
  }

  @override
  AsyncResult<Unit, Exception> saveTheme({required ThemeState themeState}) {
    _appSettings = _appSettings.copyWith(theme: themeState.name);

    return _localStorage.saveAppSettings(appSettings: _appSettings);
  }
}

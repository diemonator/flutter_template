import 'package:result_dart/result_dart.dart';

import '../../domain/models/locale_data.dart';
import '../../domain/models/theme_state.dart';

import '../../domain/models/user_settings/user_settings.dart';
import '../../domain/repositories/locale_settings_repo.dart';
import '../../domain/repositories/theme_settings_repo.dart';
import '../data_sources/local/local_storage.dart';

class UserSettingsRepoImpl implements ThemeSettingsRepo, LocaleSettingsRepo {
  UserSettingsRepoImpl(this._localStorage)
      : _userSettings = _localStorage.userSettings;

  final LocalStorage _localStorage;
  UserSettings _userSettings;

  @override
  LocaleData get locale => _localStorage.localeData;

  @override
  ThemeState get themeState => _localStorage.themeState;

  @override
  AsyncResult<Unit, Exception> saveLocale({required LocaleData localeData}) {
    _userSettings = _userSettings.copyWith.call(
      languageCode: localeData.languageCode,
      countryCode: localeData.countryCode,
      scriptCode: localeData.scriptCode,
    );

    return _localStorage.saveUserSettings(userSettings: _userSettings);
  }

  @override
  AsyncResult<Unit, Exception> saveTheme({required ThemeState themeState}) {
    _userSettings = _userSettings.copyWith.call(theme: themeState.name);

    return _localStorage.saveUserSettings(userSettings: _userSettings);
  }
}

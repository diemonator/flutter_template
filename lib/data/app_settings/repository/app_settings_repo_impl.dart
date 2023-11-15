import 'package:result_dart/result_dart.dart';

import '../../../domain/app_settings/models/app_settings/app_settings.dart';
import '../../../domain/app_settings/models/locale_data.dart';
import '../../../domain/app_settings/models/theme_state.dart';
import '../../../domain/app_settings/repositories/locale_settings_repo.dart';
import '../../../domain/app_settings/repositories/theme_settings_repo.dart';
import '../../../domain/exceptions/app_settings_exception.dart';
import '../../../domain/exceptions/exception_handler.dart';
import '../data_source/local/app_settings_storage.dart';

class AppSettingsRepoImpl implements ThemeSettingsRepo, LocaleSettingsRepo {
  AppSettingsRepoImpl(this._localStorage)
      : _appSettings = _localStorage.appSettings;

  final AppSettingsStorage _localStorage;
  AppSettings _appSettings;

  @override
  LocaleData get locale => _localStorage.localeData;

  @override
  ThemeState get themeState => _localStorage.themeState;

  @override
  AsyncResult<Unit, LocalizationSaveFailure> saveLocale({
    required LocaleData localeData,
  }) async {
    _appSettings = _appSettings.copyWith(
      languageCode: localeData.languageCode,
      countryCode: localeData.countryCode,
      scriptCode: localeData.scriptCode,
    );

    return _saveAppSettings(
      _appSettings,
      const LocalizationSaveFailure(),
    ).mapError(
      (error) => error as LocalizationSaveFailure,
    );
  }

  @override
  AsyncResult<Unit, ThemeSaveFailure> saveTheme({
    required ThemeState themeState,
  }) async {
    _appSettings = _appSettings.copyWith(theme: themeState.name);

    return _saveAppSettings(
      _appSettings,
      const ThemeSaveFailure(),
    ).mapError(
      (error) => error as ThemeSaveFailure,
    );
  }

  AsyncResult<Unit, AppSettingsException> _saveAppSettings(
    AppSettings appSettings,
    AppSettingsException appSettingsException,
  ) async {
    try {
      final result = await _localStorage.saveAppSettings(
        appSettings: appSettings,
      );

      if (result) {
        return Success.unit();
      }
    } on Exception catch (e, stackTrace) {
      e.logException(stackTrace);
    }

    return Failure(appSettingsException);
  }
}

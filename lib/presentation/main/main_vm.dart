import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../core/utils/state_management/base_vm.dart';
import '../../domain/app_settings/mappers/locale_mappers.dart';
import '../../domain/app_settings/services/app_localization.dart';
import '../../domain/app_settings/services/app_theme.dart';
import '../../domain/auth/services/auth.dart';
import '../../domain/exceptions/app_settings_exception.dart';
import '../../domain/exceptions/user_exception.dart';

final class MainVM extends BaseVM {
  MainVM(this._appTheme, this._appLocalization, this._auth);

  final AppTheme _appTheme;
  final Auth _auth;
  final AppLocalization _appLocalization;

  IconData get themeIcon => _appTheme.icon;

  Locale get currentLocale => _appLocalization.currentLocalization.locale;

  AsyncResult<Unit, UserLogoutFailed> Function() get logOut => _auth.logOut;

  AsyncResult<Unit, ThemeSaveFailure> Function() get switchToSystemTheme {
    return _appTheme.switchToSystemTheme;
  }

  AsyncResult<Unit, ThemeSaveFailure> Function() get toggleTheme {
    return _appTheme.toggleTheme;
  }

  AsyncResult<Unit, LocalizationSaveFailure> changeLocale(Locale locale) {
    return _appLocalization.changeLocale(locale.localeData);
  }
}

import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../app/utils/state_management/base_vm.dart';
import '../../domain/app_settings/mappers/locale_mappers.dart';
import '../../domain/app_settings/services/app_localization.dart';
import '../../domain/app_settings/services/app_theme.dart';
import '../../domain/auth/services/auth.dart';

final class MainVM extends BaseVM {
  MainVM(this._appTheme, this._appLocalization, this._auth);

  final AppTheme _appTheme;
  final Auth _auth;
  final AppLocalization _appLocalization;

  AsyncResult<Unit, String> Function() get switchToSystemTheme {
    return _appTheme.switchToSystemTheme;
  }

  AsyncResult<Unit, String> Function() get toggleTheme => _appTheme.toggleTheme;

  AsyncResult<Unit, String> Function() get logOut => _auth.logOut;

  IconData get themeIcon => _appTheme.icon;

  Locale get currentLocale => _appLocalization.currentLocalization.locale;

  AsyncResult<Unit, String> changeLocale(Locale locale) =>
      _appLocalization.changeLocale(locale.localeData);
}

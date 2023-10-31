import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../app/utils/state_management/base_vm.dart';
import '../../domain/services/app_localization.dart';
import '../../domain/services/app_theme.dart';
import '../../domain/services/auth.dart';
import '../mappers/locale_mappers.dart';

final class MainVM extends BaseVM {
  MainVM(this._appTheme, this._appLocalization, this._auth);

  final AppTheme _appTheme;
  final Auth _auth;
  final AppLocalization _appLocalization;

  AsyncResult<Unit, Exception> get toggleTheme => _appTheme.toggleTheme();

  AsyncResult<Unit, Exception> get switchToSystemTheme =>
      _appTheme.switchToSystemTheme();

  IconData get themeIcon => _appTheme.icon;

  Locale get currentLocale => _appLocalization.currentLocalization.locale;

  AsyncResult<Unit, Exception> changeLocale(Locale locale) =>
      _appLocalization.changeLocale(locale.localeData);

  void Function() get logOut => _auth.logOut;
}

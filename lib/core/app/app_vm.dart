import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/app_settings/mappers/locale_mappers.dart';
import '../../domain/app_settings/services/app_localization.dart';
import '../../domain/app_settings/services/app_theme.dart';
import '../utils/state_management/base_vm.dart';

final class AppVM extends BaseVM {
  AppVM({
    required final AppTheme appTheme,
    required final AppLocalization appLocalization,
  })  : _appTheme = appTheme,
        _appLocalization = appLocalization;

  final AppTheme _appTheme;
  final AppLocalization _appLocalization;

  List<LocalizationsDelegate<Object>> get localizationsDelegates {
    return _appLocalization.localizationsDelegates;
  }

  ThemeData get theme => _appTheme.theme;

  ThemeData get darkTheme => _appTheme.darkTheme;

  ThemeMode get themeMode => _appTheme.themeMode;

  String get title => kIsWeb ? 'Flutter Web App' : 'Flutter App';

  IconData? get themeIcon => _appTheme.icon;

  Locale get currentLocale => _appLocalization.currentLocalization.locale;

  @override
  Future<void> init() async {
    _appTheme.addListener(notifyListeners);
    _appLocalization.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _appTheme.removeListener(notifyListeners);
    _appLocalization.removeListener(notifyListeners);
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import '../../../app/constants/consts.dart';
import '../mappers/theme_mappers.dart';
import '../models/theme_state.dart';
import '../repositories/theme_settings_repo.dart';

final class AppTheme extends ChangeNotifier {
  AppTheme(this._themeSettingsRepo) {
    _themeState = _initialiseTheme;
  }

  final ThemeData theme = ThemeData(
    fontFamily: Consts.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.blue,
  );

  final ThemeData darkTheme = ThemeData(
    fontFamily: Consts.fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.blue,
  );

  final ThemeSettingsRepo _themeSettingsRepo;
  late ThemeState _themeState;

  ThemeMode get themeMode => _themeState.toThemeMode();

  IconData get icon =>
      _themeState == ThemeState.light ? Icons.dark_mode : Icons.sunny;

  AsyncResult<Unit, String> toggleTheme() {
    _themeState = _toggleTheme;

    final brightness =
        _themeState == ThemeState.dark ? Brightness.light : Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: brightness),
    );

    return _themeSettingsRepo.saveTheme(themeState: _themeState).onSuccess(
          (_) => notifyListeners(),
        );
  }

  AsyncResult<Unit, String> switchToSystemTheme() async {
    final systemTheme = _currentSystemTheme;

    return _themeSettingsRepo
        .saveTheme(themeState: ThemeState.system)
        .onSuccess(
      (_) {
        if (systemTheme != _themeState) {
          _themeState = systemTheme;
          notifyListeners();
        }
      },
    );
  }

  ThemeState get _initialiseTheme {
    final themeState = _themeSettingsRepo.themeState;

    if (themeState == ThemeState.system) {
      return _currentSystemTheme;
    }

    return themeState;
  }

  ThemeState get _currentSystemTheme =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.light
          ? ThemeState.light
          : ThemeState.dark;

  ThemeState get _toggleTheme =>
      _themeState == ThemeState.light ? ThemeState.dark : ThemeState.light;
}

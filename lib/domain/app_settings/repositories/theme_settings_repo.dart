import 'package:result_dart/result_dart.dart';

import '../../exceptions/app_settings_exception.dart';
import '../models/theme_state.dart';

abstract interface class ThemeSettingsRepo {
  ThemeState get themeState;

  AsyncResult<Unit, ThemeSaveFailure> saveTheme({
    required ThemeState themeState,
  });
}

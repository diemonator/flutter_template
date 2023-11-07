import 'package:result_dart/result_dart.dart';

import '../models/theme_state.dart';

abstract interface class ThemeSettingsRepo {
  ThemeState get themeState;

  AsyncResult<Unit, String> saveTheme({required ThemeState themeState});
}

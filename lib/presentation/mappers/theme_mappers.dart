import 'package:flutter/material.dart';

import '../../domain/app_settings/models/theme_state.dart';

extension ThemeMappers on ThemeState {
  ThemeMode toThemeMode() => switch (this) {
    ThemeState.system => ThemeMode.system,
    ThemeState.light => ThemeMode.light,
    ThemeState.dark => ThemeMode.dark,
  };
}

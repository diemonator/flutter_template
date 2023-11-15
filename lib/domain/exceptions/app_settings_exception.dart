sealed class AppSettingsException implements Exception {
  const AppSettingsException();
}

final class ThemeSaveFailure extends AppSettingsException {
  const ThemeSaveFailure();
}

final class LocalizationSaveFailure extends AppSettingsException {
  const LocalizationSaveFailure();
}

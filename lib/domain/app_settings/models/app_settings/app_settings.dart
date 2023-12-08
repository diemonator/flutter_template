import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/consts.dart';
import '../locale_data.dart';
import '../theme_state.dart';

part 'app_settings.freezed.dart';

part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required final String languageCode,
    required final String theme,
    final String? scriptCode,
    final String? countryCode,
  }) = _AppSettings;

  factory AppSettings.empty() => _AppSettings(
        languageCode: kDefaultLang,
        theme: ThemeState.system.name,
      );

  factory AppSettings.fromJson(Map<String, Object?> json) =>
      _$AppSettingsFromJson(json);

  const AppSettings._();

  ThemeState get themeState => ThemeState.values.byName(theme);

  LocaleData get localeDate => LocaleData(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
}

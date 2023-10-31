import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/constants/consts.dart';
import '../locale_data.dart';
import '../theme_state.dart';

part 'user_settings.freezed.dart';

part 'user_settings.g.dart';

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    required final String languageCode,
    required final String theme,
    final String? scriptCode,
    final String? countryCode,
  }) = _UserSettings;

  factory UserSettings.empty() => _UserSettings(
        languageCode: kDefaultLang,
        theme: ThemeState.system.name,
      );

  factory UserSettings.fromJson(Map<String, Object?> json) =>
      _$UserSettingsFromJson(json);

  const UserSettings._();

  ThemeState get themeState => ThemeState.values.byName(theme);

  LocaleData get localeDate => LocaleData(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
}

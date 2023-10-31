import '../localization/generated/l10n.dart';

sealed class Consts {
  /// Add your constants here.

  static const String fontFamily = 'Roboto';

  static const String userSettings = 'user_settings';

  static const String user = 'user';
}

final String kDefaultLang = Lang.delegate.supportedLocales.first.languageCode;

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:result_dart/result_dart.dart';

import '../../../app/localization/generated/l10n.dart';
import '../models/locale_data.dart';
import '../repositories/locale_settings_repo.dart';

final class AppLocalization extends ChangeNotifier {
  AppLocalization(this._localeSettingsRepo)
      : _currentLocale = _localeSettingsRepo.locale;

  final List<LocalizationsDelegate<Object>> localizationsDelegates = const [
    Lang.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final LocaleSettingsRepo _localeSettingsRepo;

  LocaleData _currentLocale;

  LocaleData get currentLocalization => _currentLocale;

  AsyncResult<Unit, String> changeLocale(LocaleData locale) async {
    _currentLocale = locale;

    final result = _localeSettingsRepo.saveLocale(
      localeData: LocaleData(
        languageCode: locale.languageCode,
        scriptCode: locale.scriptCode,
        countryCode: locale.countryCode,
      ),
    );

    return result.onSuccess((_) => notifyListeners());
  }
}

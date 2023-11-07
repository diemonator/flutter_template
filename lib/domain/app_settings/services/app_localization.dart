import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';

import '../models/locale_data.dart';
import '../repositories/locale_settings_repo.dart';

final class AppLocalization extends ChangeNotifier {
  AppLocalization(this._localeSettingsRepo) {
    _currentLocale = _initialiseLocale;
  }

  final LocaleSettingsRepo _localeSettingsRepo;

  late LocaleData _currentLocale;

  LocaleData get currentLocalization => _currentLocale;

  LocaleData get _initialiseLocale => _localeSettingsRepo.locale;

  AsyncResult<Unit, String> changeLocale(LocaleData locale) async {
    _currentLocale = locale;

    final result = _localeSettingsRepo.saveLocale(
      localeData: LocaleData(
        languageCode: locale.languageCode,
        scriptCode: locale.scriptCode,
        countryCode: locale.countryCode,
      ),
    );

    return result.onSuccess(
      (success) => notifyListeners(),
    );
  }
}

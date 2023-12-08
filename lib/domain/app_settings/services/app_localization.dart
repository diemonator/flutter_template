import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:result_dart/result_dart.dart';

import '../../../core/localization/generated/l10n.dart';
import '../../exceptions/app_settings_exception.dart';
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

  AsyncResult<Unit, LocalizationSaveFailure> changeLocale(LocaleData locale) {
    return _localeSettingsRepo
        .saveLocale(
      localeData: LocaleData(
        languageCode: locale.languageCode,
        scriptCode: locale.scriptCode,
        countryCode: locale.countryCode,
      ),
    )
        .onSuccess((_) {
      _currentLocale = locale;
      notifyListeners();
    });
  }
}

import 'package:flutter/material.dart';

import '../../domain/models/locale_data.dart';

extension LocaleMappers on Locale {
  LocaleData get localeData => LocaleData(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
}

extension LocaleDataMappers on LocaleData {
  Locale get locale => Locale.fromSubtags(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
}

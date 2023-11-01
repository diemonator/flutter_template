import 'package:result_dart/result_dart.dart';

import '../models/locale_data.dart';

abstract interface class LocaleSettingsRepo {
  AsyncResult<Unit, Exception> saveLocale({
    required LocaleData localeData,
  });

  LocaleData get locale;
}

import 'package:result_dart/result_dart.dart';

import '../models/locale_data.dart';

abstract interface class LocaleSettingsRepo {
  LocaleData get locale;

  AsyncResult<Unit, String> saveLocale({required LocaleData localeData});
}

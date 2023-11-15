import 'package:result_dart/result_dart.dart';

import '../../exceptions/app_settings_exception.dart';
import '../models/locale_data.dart';

abstract interface class LocaleSettingsRepo {
  LocaleData get locale;

  AsyncResult<Unit, LocalizationSaveFailure> saveLocale({
    required LocaleData localeData,
  });
}

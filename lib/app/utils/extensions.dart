import 'package:flutter/material.dart';

import '../localization/generated/l10n.dart';

extension AppLocalizationsExtension on BuildContext {
  Lang get lang => Lang.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}

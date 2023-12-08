import 'package:flutter/material.dart';

import '../localization/generated/l10n.dart';

extension AppLocalizationsExtension on BuildContext {
  Lang get lang => Lang.of(this);
}

extension SnackbarExtension on BuildContext {
  void showSimpleSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

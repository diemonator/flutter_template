import 'package:flutter/material.dart';

import '../../../app/localization/generated/l10n.dart';

extension TabItems on BottomNavigationBar {
  static List<BottomNavigationBarItem> of(BuildContext context) {
    final lang = Lang.of(context);

    return List.unmodifiable(
      [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: lang.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business),
          label: lang.business,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.school),
          label: lang.school,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: lang.settings,
        ),
      ],
    );
  }
}

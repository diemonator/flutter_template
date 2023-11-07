import 'package:flutter/material.dart';

import '../../../app/localization/generated/l10n.dart';

extension TabItems on Scaffold {
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

  static List<NavigationRailDestination> navOf(BuildContext context) {
    final lang = Lang.of(context);

    return List.unmodifiable(
      [
        NavigationRailDestination(
          icon: const Icon(Icons.home),
          label: Text(lang.home),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.business),
          label: Text(lang.business),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.school),
          label: Text(lang.school),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.settings),
          label: Text(lang.settings),
        ),
      ],
    );
  }
}

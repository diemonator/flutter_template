import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/tab_items.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth <= 600) {
      final tabItems = TabItems.of(context);
      final colorScheme = Theme.of(context).colorScheme;

      return BottomNavigationBar(
        currentIndex: _navigationShell.currentIndex,
        onTap: _navigationShell.goBranch,
        unselectedItemColor: colorScheme.onBackground,
        selectedItemColor: colorScheme.primary,
        items: tabItems,
      );
    }

    return const SizedBox.shrink();
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/tab_items.dart';

class MainBody extends StatelessWidget {
  const MainBody(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Row(
      children: [
        if (screenWidth > 600)
          NavigationRail(
            extended: true,
            destinations: TabItems.navOf(context),
            selectedIndex: _navigationShell.currentIndex,
            onDestinationSelected: _navigationShell.goBranch,
          ),
        Expanded(child: _navigationShell),
      ],
    );
  }
}

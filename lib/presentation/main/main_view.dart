import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/bottom_navbar.dart';
import 'widgets/main_app_bar.dart';
import 'widgets/main_body.dart';

class MainView extends StatelessWidget {
  const MainView(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: MainBody(_navigationShell),
      bottomNavigationBar: BottomNavbar(_navigationShell),
    );
  }
}

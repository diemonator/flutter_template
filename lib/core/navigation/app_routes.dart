import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Auth path.
const String _authPath = 'auth';
const String _tab = 'tab';
const String _error = 'error';

enum AppRoutes {
  onboarding('onboarding', '/onboarding'),
  login('login', '/$_authPath/login'),
  register('register', '/$_authPath/register'),
  homeDetails('details', 'details'),
  noInternet('${_error}_internet', '/$_error/internet'),

  /// App tabs settings.
  homeTab.tab(
    'home',
    '/$_tab/home',
    iconData: Icons.home_outlined,
    activeIcon: Icons.home,
  ),
  schoolTab.tab(
    'school',
    '/$_tab/school',
    iconData: Icons.school_outlined,
    activeIcon: Icons.school,
  ),
  businessTab.tab(
    'business',
    '/$_tab/business',
    iconData: Icons.business_outlined,
    activeIcon: Icons.business,
  ),
  settingsTab.tab(
    'settings',
    '/$_tab/settings',
    iconData: Icons.settings_outlined,
    activeIcon: Icons.settings,
  ),
  ;

  const AppRoutes(this.name, this.path)
      : isTab = false,
        activeIcon = null,
        iconData = null;

  const AppRoutes.tab(
    this.name,
    this.path, {
    required this.iconData,
    required this.activeIcon,
  }) : isTab = true;

  final String name;
  final String path;
  final IconData? iconData;
  final IconData? activeIcon;
  final bool isTab;

  static List<AppRoutes> get tabs {
    return values.where((element) => element.isTab).toList(growable: false);
  }

  static List<BottomNavigationBarItem> get navbarItems {
    return tabs
        .map(
          (e) => BottomNavigationBarItem(
            label: Intl.message(e.name),
            icon: Icon(e.iconData),
            activeIcon: Icon(e.activeIcon),
            tooltip: e.name,
          ),
        )
        .toList(growable: false);
  }

  static List<NavigationRailDestination> get navRailItems {
    return tabs
        .map(
          (e) => NavigationRailDestination(
            label: Text(Intl.message(e.name)),
            icon: Icon(e.iconData),
            selectedIcon: Icon(e.activeIcon),
          ),
        )
        .toList(growable: false);
  }
}

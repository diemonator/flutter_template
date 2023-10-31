import 'package:flutter/material.dart';

import '../../../app/constants/app_routes.dart';
import '../../../app/localization/generated/l10n.dart';
import '../tabs/business_view.dart';
import '../tabs/home_view.dart';
import '../tabs/school_view.dart';
import '../tabs/settings_view.dart';

class TabItemModel {
  const TabItemModel._({
    required this.bottomNavigationBarItem,
    required this.scaffoldBody,
    required this.location,
  });

  final BottomNavigationBarItem bottomNavigationBarItem;
  final Widget scaffoldBody;
  final String location;

  static TabItemModel itemOf(BuildContext context, String route) {
    final list = of(context);

    return list.firstWhere(
      (element) => route == element.location,
    );
  }

  static List<TabItemModel> of(BuildContext context) {
    final lang = Lang.of(context);

    return [
      TabItemModel._(
        bottomNavigationBarItem: BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: lang.home,
        ),
        scaffoldBody: const HomeView(),
        location: AppRoutes.homeTabPath,
      ),
      TabItemModel._(
        bottomNavigationBarItem: BottomNavigationBarItem(
          icon: const Icon(Icons.business),
          label: lang.business,
        ),
        scaffoldBody: const BusinessView(),
        location: AppRoutes.businessTabPath,
      ),
      TabItemModel._(
        bottomNavigationBarItem: BottomNavigationBarItem(
          icon: const Icon(Icons.school),
          label: lang.school,
        ),
        scaffoldBody: const SchoolView(),
        location: AppRoutes.schoolTabPath,
      ),
      TabItemModel._(
        bottomNavigationBarItem: BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: lang.settings,
        ),
        scaffoldBody: const SettingsView(),
        location: AppRoutes.settingsTabPath,
      ),
    ];
  }
}

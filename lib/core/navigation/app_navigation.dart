import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/auth/login/login_view.dart';
import '../../../presentation/auth/login/login_vm.dart';
import '../../../presentation/main/main_view.dart';
import '../../domain/auth/services/auth.dart';
import '../../presentation/auth/register/register_view.dart';
import '../../presentation/auth/register/register_vm.dart';
import '../../presentation/home_details/home_details_view.dart';
import '../../presentation/main/main_vm.dart';
import '../../presentation/main/tabs/business_view.dart';
import '../../presentation/main/tabs/home_view.dart';
import '../../presentation/main/tabs/school_view.dart';
import '../../presentation/main/tabs/settings_view.dart';
import '../di/app_locator.dart';
import '../utils/state_management/vm_builder.dart';
import 'app_routes.dart';

part 'app_navigation_util.dart';

const _rootNavigatorKey = GlobalObjectKey<NavigatorState>('root');

final GoRouter goRouterDelegate = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: _initInitialPath,
  refreshListenable: locator.inject<Auth>(),
  redirect: _authenticationRedirect,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRoutes.login.name,
      path: AppRoutes.login.path,
      builder: (context, state) => VMBuilder<LoginVM>(
        viewModelBuilder: locator.inject,
        child: LoginView(key: state.pageKey),
      ),
    ),
    GoRoute(
      name: AppRoutes.register.name,
      path: AppRoutes.register.path,
      builder: (context, state) => VMBuilder<RegisterVM>(
        viewModelBuilder: locator.inject,
        child: RegisterView(key: state.pageKey),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => VMBuilder<MainVM>(
        viewModelBuilder: locator.inject,
        child: MainView(navigationShell, key: state.pageKey),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.homeTab.name,
              path: AppRoutes.homeTab.path,
              pageBuilder: (context, state) => NoTransitionPage<Widget>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const HomeView(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: AppRoutes.homeDetails.name,
                  path: AppRoutes.homeDetails.path,
                  builder: (context, state) => const HomeDetailsView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.businessTab.name,
              path: AppRoutes.businessTab.path,
              pageBuilder: (context, state) => NoTransitionPage<Widget>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const BusinessView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.schoolTab.name,
              path: AppRoutes.schoolTab.path,
              pageBuilder: (context, state) => NoTransitionPage<Widget>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const SchoolView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.settingsTab.name,
              path: AppRoutes.settingsTab.path,
              pageBuilder: (context, state) => NoTransitionPage<Widget>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const SettingsView(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

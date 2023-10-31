import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/services/auth.dart';
import '../../../presentation/authentication/login/login_view.dart';
import '../../../presentation/authentication/login/login_vm.dart';
import '../../../presentation/main/main_view.dart';
import '../../../presentation/main/main_vm.dart';
import '../../presentation/authentication/register/register_view.dart';
import '../../presentation/authentication/register/register_vm.dart';
import '../../presentation/home_details/home_details_view.dart';
import '../../presentation/main/tabs/business_view.dart';
import '../../presentation/main/tabs/home_view.dart';
import '../../presentation/main/tabs/school_view.dart';
import '../../presentation/main/tabs/settings_view.dart';
import '../constants/app_routes.dart';
import '../di/app_locator.dart';
import '../utils/state_management/vm_builder.dart';

const _rootNavigatorKey = GlobalObjectKey<NavigatorState>('root');

final GoRouter goRouterDelegate = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.loginPath,
  debugLogDiagnostics: true,
  refreshListenable: locator.inject<Auth>(),
  redirect: (context, state) => _authenticationRedirect(
    context,
    state,
    locator.inject<Auth>(),
  ),
  routes: [
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.loginPath,
      builder: (context, state) => VMBuilder<LoginVM>(
        viewModelBuilder: locator.inject,
        child: LoginView(key: state.pageKey),
      ),
    ),
    GoRoute(
      name: AppRoutes.register,
      path: AppRoutes.registerPath,
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
              name: AppRoutes.homeTab,
              path: AppRoutes.homeTabPath,
              pageBuilder: (context, state) => NoTransitionPage<Widget>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const HomeView(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: AppRoutes.homeDetails,
                  path: AppRoutes.homeDetailsPath,
                  builder: (context, state) => const HomeDetailsView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.businessTab,
              path: AppRoutes.businessTabPath,
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
              name: AppRoutes.schoolTab,
              path: AppRoutes.schoolTabPath,
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
              name: AppRoutes.settingsTab,
              path: AppRoutes.settingsTabPath,
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

String? _authenticationRedirect(
  BuildContext _,
  GoRouterState state,
  final Auth auth,
) {
  final isLoggedIn = auth.isLoggedIn;
  final goingToLogin = state.location == AppRoutes.loginPath;

  if (!isLoggedIn && !goingToLogin) {
    return AppRoutes.loginPath;
  }

  if (isLoggedIn && goingToLogin) {
    return AppRoutes.homeTabPath;
  }

  return null;
}

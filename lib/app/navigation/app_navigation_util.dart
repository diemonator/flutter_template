part of 'app_navigation.dart';

String? _authenticationRedirect(BuildContext _, GoRouterState state) {
  final isLoggedIn = locator.inject<Auth>().isLoggedIn;
  final goingToLogin = state.uri.path == AppRoutes.login.path;

  if (!isLoggedIn && !goingToLogin) {
    return AppRoutes.login.path;
  }

  if (isLoggedIn && goingToLogin) {
    return AppRoutes.homeTab.path;
  }

  return null;
}

String? get _initInitialPath {
  final route = WidgetsBinding.instance.platformDispatcher.defaultRouteName;
  if (route == '/') {
    return AppRoutes.login.path;
  }

  final list = AppRoutes.values.map((e) => e.path).toList();
  if (list.contains(route)) {
    return route;
  }

  return null;
}

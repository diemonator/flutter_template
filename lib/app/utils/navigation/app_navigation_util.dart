part of '../../navigation/app_navigation.dart';

String? _authenticationRedirect(
  BuildContext _,
  GoRouterState state,
  final Auth auth,
) {
  final isLoggedIn = auth.isLoggedIn;
  final goingToLogin = state.uri.path == AppRoutes.login.path;

  if (!isLoggedIn && !goingToLogin) {
    return AppRoutes.login.path;
  }

  if (isLoggedIn && goingToLogin) {
    return AppRoutes.homeTab.path;
  }

  return null;
}

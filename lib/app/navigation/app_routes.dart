/// Auth path.
const String _authPath = 'auth';
const String _tab = 'tab';
const String _error = 'error';

enum AppRoutes {
  homeTab('home', '/$_tab/home'),
  schoolTab('school', '/$_tab/school'),
  settingsTab('settings', '/$_tab/settings'),
  businessTab('business', '/$_tab/business'),
  onboarding('onboarding', '/onboarding'),
  login('login', '/$_authPath/login'),
  register('register', '/$_authPath/register'),
  homeDetails('details', 'details'),
  noInternet('${_error}_internet', '/$_error/internet');

  const AppRoutes(this.name, this.path);

  final String name;
  final String path;
}

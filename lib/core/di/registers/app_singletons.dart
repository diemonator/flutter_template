part of '../app_locator.dart';

Future<void> _setupSingletons(GetIt locator) async {
  /// setup auth
  final userRepo = _setupUserRepo(locator);

  /// Setup app settings
  final appSettingsRepo = await _setupAppSettingsStorage();

  locator
    ..registerLazySingleton<UserRepo>(() => userRepo)
    ..registerLazySingleton(() => Auth(userRepo))
    ..registerLazySingleton(() => AppLocalization(appSettingsRepo))
    ..registerLazySingleton(() => AppTheme(theme, darkTheme, appSettingsRepo));
}

Future<AppSettingsRepoImpl> _setupAppSettingsStorage() async {
  final sharedPref = await SharedPreferences.getInstance();
  final appStorage = AppSettingsStorage(LocalStorage(sharedPref));

  return AppSettingsRepoImpl(appStorage);
}

UserRepo _setupUserRepo(GetIt locator) {
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  const authStorage = AuthLocalStorage(SecureLocalStorage(secureStorage));

  final authDio = Dio();
  authDio.interceptors.addAll([
    AuthInterceptor(
      () => locator<Auth>().authHeader,
      () => locator<Auth>().refreshToken(),
    ),
    RetryInterceptor(dio: authDio),
  ]);

  final authApi = AuthApi(Api(authDio));

  return UserRepoImpl(authStorage, authApi);
}

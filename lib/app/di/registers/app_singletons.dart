part of '../app_locator.dart';

Future<void> _setupSingletons(GetIt locator) async {
  final pref = await SharedPreferences.getInstance();

  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  const secureLocalStorage = SecureLocalStorage(secureStorage);
  final appStorage = AppSettingsStorage(pref);
  final authApi = AuthApi(RequestWrapper(Dio()));

  final userSettingRepo = AppSettingsRepoImpl(appStorage);
  final userRepo = UserRepoImpl(secureLocalStorage, authApi);

  locator
    ..registerLazySingleton<UserRepo>(() => userRepo)
    ..registerLazySingleton(() => Auth(userRepo))
    ..registerLazySingleton<ThemeSettingsRepo>(() => userSettingRepo)
    ..registerLazySingleton<LocaleSettingsRepo>(() => userSettingRepo)
    ..registerLazySingleton(() => appStorage)
    ..registerLazySingleton(() => AppLocalization(locator()))
    ..registerLazySingleton(() => AppTheme(locator()));
}

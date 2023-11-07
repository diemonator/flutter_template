part of '../app_locator.dart';

Future<void> _setupSingletons(GetIt locator) async {
  final localStorage = await SharedPreferences.getInstance();

  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  const secureLocalStorage = SecureLocalStorage(secureStorage);
  final appStorage = AppSettingsStorage(localStorage);
  final authApi = AuthApi(RequestWrapper(Dio()));

  final appSettingRepo = AppSettingsRepoImpl(appStorage);
  final userRepo = UserRepoImpl(secureLocalStorage, authApi);

  locator
    ..registerLazySingleton<UserRepo>(() => userRepo)
    ..registerLazySingleton(() => Auth(userRepo))
    ..registerLazySingleton<ThemeSettingsRepo>(() => appSettingRepo)
    ..registerLazySingleton<LocaleSettingsRepo>(() => appSettingRepo)
    ..registerLazySingleton(() => appStorage)
    ..registerLazySingleton(() => AppLocalization(locator()))
    ..registerLazySingleton(() => AppTheme(locator()));
}

part of '../app_locator.dart';

Future<void> _setupSingletons(GetIt locator) async {
  final pref = await SharedPreferences.getInstance();

  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  const secureLocalStorage = SecureLocalStorage(secureStorage);
  final appStorage = AppSettingsStorage(pref);

  final user = await secureLocalStorage.getUser();

  final userSettingRepo = AppSettingsRepoImpl(appStorage);
  final userRepo = UserRepoImpl(secureLocalStorage, user);

  locator
    ..registerSingleton(Auth())
    ..registerSingleton<ThemeSettingsRepo>(userSettingRepo)
    ..registerSingleton<LocaleSettingsRepo>(userSettingRepo)
    ..registerSingleton<UserRepo>(userRepo)
    ..registerSingleton(appStorage)
    ..registerSingleton(AppLocalization(locator()))
    ..registerSingleton(
      AppTheme(locator()),
    );
}

part of '../app_locator.dart';

void _setupFactories(GetIt locator) {
  locator
    ..registerFactory(
      () => AppVM(
        appTheme: locator(),
        appLocalization: locator(),
      ),
    )
    ..registerFactory(() => MainVM(locator(), locator(), locator()))
    ..registerFactory(
      () => LoginVM(locator()),
    )
  ..registerFactory(RegisterVM.new);
}

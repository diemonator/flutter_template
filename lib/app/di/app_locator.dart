import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/app_settings/data_source/local/app_settings_storage.dart';
import '../../data/app_settings/repository/app_settings_repo_impl.dart';
import '../../data/auth/data_source/local/secure_local_storage.dart';
import '../../data/auth/repository/user_repo_impl.dart';
import '../../domain/app_settings/repositories/locale_settings_repo.dart';
import '../../domain/app_settings/repositories/theme_settings_repo.dart';
import '../../domain/app_settings/services/app_localization.dart';
import '../../domain/app_settings/services/app_theme.dart';
import '../../domain/auth/repositories/user_repo.dart';
import '../../domain/auth/services/auth.dart';
import '../../presentation/auth/login/login_vm.dart';
import '../../presentation/auth/register/register_vm.dart';
import '../../presentation/main/main_vm.dart';
import '../app_vm.dart';
import '../utils/di/app_locator_wrapper.dart';

part 'registers/app_factories.dart';
part 'registers/app_singletons.dart';

final locator = AppLocatorWrapper(
  GetIt.I,
  initLocator: (locator) async {
    await _setupSingletons(locator);
    _setupFactories(locator);
  },
);

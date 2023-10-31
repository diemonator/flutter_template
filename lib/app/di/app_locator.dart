import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_sources/local/local_storage.dart';
import '../../data/data_sources/local/secure_local_storage.dart';
import '../../data/repositories/user_repo_impl.dart';
import '../../data/repositories/user_settings_repo_impl.dart';
import '../../domain/repositories/locale_settings_repo.dart';
import '../../domain/repositories/theme_settings_repo.dart';
import '../../domain/repositories/user_repo.dart';
import '../../domain/services/app_localization.dart';
import '../../domain/services/app_theme.dart';
import '../../domain/services/auth.dart';
import '../../presentation/authentication/login/login_vm.dart';
import '../../presentation/authentication/register/register_vm.dart';
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

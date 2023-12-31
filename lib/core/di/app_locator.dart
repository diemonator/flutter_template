import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/app_settings/data_source/local/app_settings_storage.dart';
import '../../data/app_settings/repository/app_settings_repo_impl.dart';
import '../../data/auth/data_source/local/auth_local_storage.dart';
import '../../data/auth/data_source/remote/auth_api.dart';
import '../../data/auth/data_source/remote/auth_interceptor.dart';
import '../../data/auth/repository/user_repo_impl.dart';
import '../../domain/app_settings/services/app_localization.dart';
import '../../domain/app_settings/services/app_theme.dart';
import '../../domain/auth/repositories/user_repo.dart';
import '../../domain/auth/services/auth.dart';
import '../../presentation/auth/login/login_vm.dart';
import '../../presentation/auth/register/register_vm.dart';
import '../../presentation/main/main_vm.dart';
import '../app/app_vm.dart';
import '../themes/themes.dart';
import '../utils/di/app_locator_wrapper.dart';
import '../utils/local_storages/local_storage.dart';
import '../utils/local_storages/secure_local_storage.dart';
import '../utils/network/api.dart';

part 'registers/app_factories.dart';
part 'registers/app_singletons.dart';

final locator = AppLocatorWrapper(
  GetIt.I,
  initLocator: (locator) async {
    await _setupSingletons(locator);
    _setupFactories(locator);
  },
);

import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/di/app_locator.dart';
import 'domain/auth/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await locator.initLocator();
  await locator.inject<Auth>().initAuth();

  runApp(const App());
}

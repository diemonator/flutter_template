import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/app_locator.dart';
import 'domain/auth/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await locator.initLocator();
  await locator.inject<Auth>().initAuth();

  runApp(const App());
}

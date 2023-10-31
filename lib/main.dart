import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/app_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await locator.initLocator();

  runApp(const App());
}

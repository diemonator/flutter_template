import 'package:flutter/material.dart';

import '../constants/consts.dart';

final ThemeData theme = ThemeData(
  fontFamily: Consts.fontFamily,
  useMaterial3: true,
  brightness: Brightness.light,
  colorSchemeSeed: Colors.blue,
);

final ThemeData darkTheme = ThemeData(
  fontFamily: Consts.fontFamily,
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.blue,
);

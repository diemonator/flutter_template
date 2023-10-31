import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

extension StateExtensions on BuildContext {
  T read<T>() => Provider.of<T>(this, listen: false);

  T watch<T>() => Provider.of<T>(this);

  R selector<T, R>(R Function(T value) selector) => select<T, R>(selector);
}

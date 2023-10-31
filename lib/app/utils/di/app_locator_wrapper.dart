import 'package:get_it/get_it.dart';

final class AppLocatorWrapper {
  const AppLocatorWrapper(
    this._current, {
    required final Future<void> Function(GetIt current) initLocator,
  }) : _initLocator = initLocator;

  final GetIt _current;
  final Future<void> Function(GetIt current) _initLocator;

  T inject<T extends Object>() => _current<T>();

  Future<void> initLocator() => _initLocator(_current);
}

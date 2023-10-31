import 'package:flutter/widgets.dart';

abstract base class BaseVM extends ChangeNotifier {
  bool _isDisposed = false;

  Future<void> init() async {}

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}

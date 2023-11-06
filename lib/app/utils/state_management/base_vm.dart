import 'dart:async';

import 'package:flutter/widgets.dart';

import 'ui_state.dart';

abstract base class BaseVM extends ChangeNotifier {
  bool _isDisposed = false;

  Future<void> init() async {}

  UIState _uiState = UIState.loading;
  UIState get uiState => _uiState;

  void setLoading() {
    if (_uiState != UIState.loading) {
      _uiState = UIState.loading;
      notifyListeners();
    }
  }

  void setSuccess() {
    if (_uiState != UIState.success) {
      _uiState = UIState.success;
      notifyListeners();
    }
  }

  void setError() {
    if (_uiState != UIState.error) {
      _uiState = UIState.error;
      notifyListeners();
    }
  }

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

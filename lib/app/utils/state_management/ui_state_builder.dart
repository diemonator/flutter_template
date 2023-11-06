import 'package:flutter/material.dart';

import 'ui_state.dart';

class UIStateBuilder extends StatelessWidget {
  const UIStateBuilder(
    this.uiState, {
    required this.successState,
    this.errorState,
    this.loadingState,
    super.key,
  });

  final UIState uiState;
  final Widget successState;
  final Widget? errorState;
  final Widget? loadingState;

  @override
  Widget build(BuildContext context) {
    return switch (uiState) {
      UIState.success => successState,
      UIState.error => errorState ?? const Text('Something went wrong'),
      UIState.loading => loadingState ?? const CircularProgressIndicator()
    };
  }
}

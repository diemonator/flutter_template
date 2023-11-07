import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'base_vm.dart';

final class VMBuilder<T extends BaseVM> extends StatefulWidget {
  const VMBuilder({
    required this.viewModelBuilder,
    this.child,
    this.builder,
    this.lazy = false,
    super.key,
  });

  final T Function() viewModelBuilder;
  final TransitionBuilder? builder;
  final Widget? child;
  final bool lazy;

  @override
  State<VMBuilder<T>> createState() => _VMBuilderState<T>();
}

class _VMBuilderState<T extends BaseVM> extends State<VMBuilder<T>> {
  late T _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModelBuilder();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<T>(
    lazy: widget.lazy,
    create: (context) => _viewModel,
    builder: widget.builder,
    child: widget.child,
  );
}

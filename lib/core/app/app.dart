import 'package:flutter/material.dart';

import '../di/app_locator.dart';
import '../localization/generated/l10n.dart';
import '../navigation/app_navigation.dart';
import '../utils/state_management/state_extensions.dart';
import '../utils/state_management/vm_builder.dart';
import 'app_vm.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return VMBuilder<AppVM>(
      viewModelBuilder: locator.inject,
      builder: (context, child) {
        final viewModel = context.watch<AppVM>();

        return MaterialApp.router(
          title: viewModel.title,
          theme: viewModel.theme,
          darkTheme: viewModel.darkTheme,
          themeMode: viewModel.themeMode,
          debugShowCheckedModeBanner: false,
          locale: viewModel.currentLocale,
          supportedLocales: Lang.delegate.supportedLocales,
          localizationsDelegates: viewModel.localizationsDelegates,
          routerConfig: goRouterDelegate,
        );
      },
    );
  }
}

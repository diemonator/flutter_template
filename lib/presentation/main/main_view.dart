import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_dart/result_dart.dart';

import '../../app/localization/generated/l10n.dart';
import '../../app/utils/state_management/state_extensions.dart';
import 'main_vm.dart';
import 'models/tab_items.dart';

class MainView extends StatelessWidget {
  const MainView(this._navigationShell, {super.key});

  final StatefulNavigationShell _navigationShell;

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final viewModel = context.read<MainVM>();

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.mainScreen),
        actions: [
          DropdownButton<Locale>(
            padding: const EdgeInsets.all(8.0),
            value: viewModel.currentLocale,
            items: List.unmodifiable(
              Lang.delegate.supportedLocales.map((locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode),
                );
              }),
            ),
            onChanged: (localeValue) {
              final locale = localeValue;
              if (locale != null) {
                viewModel.changeLocale(locale).onFailure(
                  (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  },
                );
              }
            },
          ),
          IconButton(
            onPressed: () => viewModel.toggleTheme.onFailure(
              (message) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              ),
            ),
            icon: Icon(viewModel.themeIcon),
          ),
          IconButton(
            onPressed: () => viewModel.switchToSystemTheme.onFailure(
              (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            ),
            icon: const Icon(Icons.system_update_alt),
          ),
          IconButton(
            onPressed: () => viewModel.logOut().onFailure(
              (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            ),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _navigationShell,
      bottomNavigationBar: Builder(
        builder: (context) {
          final tabItemModels = TabItems.of(context);
          final colorScheme = Theme.of(context).colorScheme;

          return BottomNavigationBar(
            currentIndex: _navigationShell.currentIndex,
            onTap: _navigationShell.goBranch,
            unselectedItemColor: colorScheme.onBackground,
            selectedItemColor: colorScheme.primary,
            items: tabItemModels,
          );
        },
      ),
    );
  }
}

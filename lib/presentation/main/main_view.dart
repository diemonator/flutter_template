import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/localization/generated/l10n.dart';
import '../../app/utils/state_management/state_extensions.dart';
import 'main_vm.dart';
import 'models/tab_item_model.dart';

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
            items: Lang.delegate.supportedLocales
                .map(
                  (e) => DropdownMenuItem<Locale>(
                    value: e,
                    child: Text(e.languageCode),
                  ),
                )
                .toList(growable: false),
            onChanged: (value) async {
              final locale = value;

              if (locale != null) {
                final result = await viewModel.changeLocale(locale);

                if (result.isError() && context.mounted) {
                  final exception =
                      result.exceptionOrNull()?.toString() ?? 'Empty error';

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(exception)),
                  );
                }
              }
            },
          ),
          IconButton(
            onPressed: () async {
              final result = await viewModel.toggleTheme;

              if (result.isError() && context.mounted) {
                final exception =
                    result.exceptionOrNull()?.toString() ?? 'Empty error';

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(exception)),
                );
              }
            },
            icon: Icon(viewModel.themeIcon),
          ),
          IconButton(
            onPressed: () async {
              final result = await viewModel.switchToSystemTheme;

              if (result.isError() && context.mounted) {
                final exception =
                    result.exceptionOrNull()?.toString() ?? 'Empty error';

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(exception)),
                );
              }
            },
            icon: const Icon(Icons.system_update_alt),
          ),
          IconButton(
            onPressed: viewModel.logOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _navigationShell,
      bottomNavigationBar: Builder(
        builder: (context) {
          final tabItemModels = TabItemModel.of(context);
          final colorScheme = Theme.of(context).colorScheme;

          return BottomNavigationBar(
            currentIndex: _navigationShell.currentIndex,
            onTap: _navigationShell.goBranch,
            unselectedItemColor: colorScheme.onBackground,
            selectedItemColor: colorScheme.primary,
            items: tabItemModels
                .map((e) => e.bottomNavigationBarItem)
                .toList(growable: false),
          );
        },
      ),
    );
  }
}

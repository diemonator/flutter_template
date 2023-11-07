import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../../app/localization/generated/l10n.dart';
import '../../../app/utils/extensions.dart';
import '../../../app/utils/state_management/state_extensions.dart';
import '../main_vm.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final viewModel = context.read<MainVM>();

    return AppBar(
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
                    (message) => context.showSimpleSnackBar(message),
                  );
            }
          },
        ),
        IconButton(
          onPressed: () => viewModel.toggleTheme.onFailure(
            (message) => context.showSimpleSnackBar(message),
          ),
          icon: Icon(viewModel.themeIcon),
        ),
        IconButton(
          onPressed: () => viewModel.switchToSystemTheme.onFailure(
            (message) => context.showSimpleSnackBar(message),
          ),
          icon: const Icon(Icons.system_update_alt),
        ),
        IconButton(
          onPressed: () => viewModel.logOut().onFailure(
                (message) => context.showSimpleSnackBar(message),
              ),
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

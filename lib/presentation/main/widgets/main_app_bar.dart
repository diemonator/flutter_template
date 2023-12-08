import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../../core/localization/generated/l10n.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/state_management/state_extensions.dart';
import '../../../domain/exceptions/exception_handler.dart';
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
            Lang.delegate.supportedLocales.map(
              (locale) => DropdownMenuItem<Locale>(
                value: locale,
                child: Text(locale.languageCode),
              ),
            ),
          ),
          onChanged: (final locale) {
            if (locale != null) {
              viewModel.changeLocale(locale).onFailure(
                    (error) => context.showSimpleSnackBar(
                      error.localizedMessage(lang),
                    ),
                  );
            }
          },
        ),
        IconButton(
          onPressed: () => viewModel.toggleTheme().onFailure(
                (error) => context.showSimpleSnackBar(
                  error.localizedMessage(lang),
                ),
              ),
          icon: Icon(viewModel.themeIcon),
        ),
        IconButton(
          onPressed: () => viewModel.switchToSystemTheme().onFailure(
                (error) => context.showSimpleSnackBar(
                  error.localizedMessage(lang),
                ),
              ),
          icon: const Icon(Icons.system_update_alt),
        ),
        IconButton(
          onPressed: () => viewModel.logOut().onFailure(
                (error) => context.showSimpleSnackBar(
                  error.localizedMessage(lang),
                ),
              ),
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

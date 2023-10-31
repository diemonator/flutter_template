import 'package:flutter/material.dart';

import '../../../app/localization/generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(Lang.of(context).settingsView),
      );
}

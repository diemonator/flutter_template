import 'package:flutter/material.dart';

import '../../../core/localization/generated/l10n.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(Lang.of(context).schoolView),
      );
}

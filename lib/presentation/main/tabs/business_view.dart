import 'package:flutter/material.dart';

import '../../../core/localization/generated/l10n.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(Lang.of(context).businessView),
      );
}

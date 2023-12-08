import 'package:flutter/material.dart';

import '../../core/localization/generated/l10n.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(Lang.of(context).homeDetails)),
    );
  }
}

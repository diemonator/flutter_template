import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/localization/generated/l10n.dart';
import '../../../app/navigation/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.goNamed(AppRoutes.homeDetails.name),
        child: Text(Lang.of(context).homeView),
      ),
    );
  }
}

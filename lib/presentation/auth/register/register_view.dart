import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/localization/generated/l10n.dart';
import '../../../core/utils/state_management/state_extensions.dart';
import 'register_vm.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerTxt = Lang.of(context).register;

    return Scaffold(
      appBar: AppBar(
        title: Text(registerTxt),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                ),
                const Gap(60),
                TextFormField(
                  obscureText: true,
                ),
                const Gap(60),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      context.watch<RegisterVM>();

                      return ElevatedButton(
                        onPressed: () {},
                        child: Text(registerTxt),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

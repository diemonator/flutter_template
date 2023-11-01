import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../app/localization/generated/l10n.dart';
import '../../../app/utils/state_management/state_extensions.dart';
import 'login_vm.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginView> {
  late final FocusNode emailFocusNode;
  late final FocusNode passFocusNode;
  late final FocusNode btnFocusNode;

  @override
  void initState() {
    emailFocusNode = FocusNode();
    passFocusNode = FocusNode();
    btnFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginVM>();
    final lang = Lang.of(context);
    final login = lang.logIn;

    return Scaffold(
      appBar: AppBar(title: Text(login)),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              child: Builder(
                builder: (context) {
                  final form = Form.of(context);

                  return Column(
                    children: [
                      TextFormField(
                        focusNode: emailFocusNode,
                        validator: (value) => viewModel.emailValidator(
                          value ?? '',
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: lang.enterEmail),
                        onFieldSubmitted: (_) {
                          form.validate();
                          FocusScope.of(context).requestFocus(passFocusNode);
                        },
                      ),
                      const Gap(60),
                      TextFormField(
                        focusNode: passFocusNode,
                        validator: (value) => viewModel.passwordValidator(
                          value ?? '',
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: lang.enterPassword,
                        ),
                        onFieldSubmitted: (_) {
                          form.validate();
                          FocusScope.of(context).requestFocus(btnFocusNode);
                        },
                      ),
                      const Gap(60),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Builder(
                          builder: (context) {
                            final viewModel = context.watch<LoginVM>();

                            return ElevatedButton(
                              focusNode: btnFocusNode,
                              onPressed: () {
                                form.validate();
                                viewModel.logIn();
                              },
                              child: Text(login),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passFocusNode.dispose();
    btnFocusNode.dispose();

    super.dispose();
  }
}

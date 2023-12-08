import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_dart/result_dart.dart';

import '../../../core/localization/generated/l10n.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/state_management/state_extensions.dart';
import '../../../domain/exceptions/exception_handler.dart';
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
    final login = lang.login;

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
                  final focusScope = FocusScope.of(context);

                  return Column(
                    children: [
                      TextFormField(
                        focusNode: emailFocusNode,
                        validator: (emailValue) => _validator(
                          emailValue,
                          viewModel.emailValidator,
                          lang.invalidEmail,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: lang.enterEmail),
                        onFieldSubmitted: (_) {
                          form.validate();
                          focusScope.requestFocus(passFocusNode);
                        },
                      ),
                      const Gap(60),
                      TextFormField(
                        focusNode: passFocusNode,
                        validator: (passValue) => _validator(
                          passValue,
                          viewModel.passwordValidator,
                          lang.invalidPass,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: lang.enterPassword,
                        ),
                        onFieldSubmitted: (_) {
                          form.validate();
                          focusScope.requestFocus(btnFocusNode);
                        },
                      ),
                      const Gap(60),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          focusNode: btnFocusNode,
                          child: Text(login),
                          onPressed: () {
                            if (form.validate()) {
                              viewModel.logIn().onFailure(
                                    (message) => context.showSimpleSnackBar(
                                      message.localizedMessage(lang),
                                    ),
                                  );
                            }
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

  String? _validator(
    String? value,
    bool Function(String) validator,
    String errorMessage,
  ) {
    final isValid = validator(value ?? '');

    if (isValid) {
      return null;
    }

    return errorMessage;
  }
}

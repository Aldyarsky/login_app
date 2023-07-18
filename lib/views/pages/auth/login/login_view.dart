import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:login_app/app/routing/route_names.dart';

import 'package:login_app/views/widgets/custom_button.dart';
import 'package:login_app/views/widgets/custom_text_field.dart';
import 'package:login_app/views/widgets/custom_dialog.dart';
import 'package:sizer/sizer.dart';

import 'bloc/login_view_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  String? usernameValidationMessage;
  String? passwordValidationMessage;
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.loginTitle),
      ),
      child: SafeArea(
        child: BlocProvider(
          create: (context) => LoginViewBloc(),
          child: BlocConsumer<LoginViewBloc, LoginViewState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {
                  context.loaderOverlay.show();
                },
                success: (message) async {
                  context.loaderOverlay.hide();
                  await showCustomDialog(message, false, context);
                  if (context.mounted) context.goNamed(RouteNames.profile);
                },
                error: (message) {
                  context.loaderOverlay.hide();
                  showCustomDialog(message, true, context);
                },
              );
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        placeholder:
                            AppLocalizations.of(context)!.loginUsernameHint,
                        validationMessage: usernameValidationMessage,
                        controller: usernameController,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(height: 0),
                      ),
                      CustomTextField(
                        placeholder:
                            AppLocalizations.of(context)!.loginPasswordHint,
                        obscureText: true,
                        validationMessage: passwordValidationMessage,
                        controller: passwordController,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: Column(
                      children: [
                        CustomButton(
                          title: AppLocalizations.of(context)!.loginButtonTitle,
                          onPressed: () {
                            if (!_validateForm()) return;
                            context.read<LoginViewBloc>().add(
                                  LoginViewEvent.login(usernameController.text,
                                      passwordController.text),
                                );
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          title: AppLocalizations.of(context)!
                              .loginRegisterButtonTitle,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    final RegExp emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    passwordValidationMessage = null;
    usernameValidationMessage = null;
    if (usernameController.text.isEmpty) return false;

    if (!emailRegex.hasMatch(usernameController.text)) {
      setState(() {
        usernameValidationMessage =
            AppLocalizations.of(context)!.emailNotValidError;
      });
      return false;
    }

    if (passwordController.text.isEmpty) return false;
    if (passwordController.text.length < 8) {
      setState(() {
        passwordValidationMessage =
            AppLocalizations.of(context)!.passwordLengthError;
      });
      return false;
    }

    setState(() {});
    return true;
  }
}

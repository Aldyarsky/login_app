import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:login_app/views/widgets/custom_button.dart';
import 'package:login_app/views/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.loginTitle),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            placeholder: AppLocalizations.of(context)!.loginUsernameHint,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 0),
          ),
          CustomTextField(
            placeholder: AppLocalizations.of(context)!.loginPasswordHint,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                CustomButton(
                  title: AppLocalizations.of(context)!.loginButtonTitle,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                CustomButton(
                  title: AppLocalizations.of(context)!.loginButtonTitle,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/routing/go_router.dart';
import 'package:login_app/views/style/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return CupertinoApp.router(
          title: '',
          theme: AppTheme(context: context).lightTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
          ],
          routerConfig: goRouter,
        );
      },
    );
  }
}

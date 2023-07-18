import 'package:flutter/material.dart';
import 'package:login_app/app/application.dart';
import 'package:login_app/app/auth_provider/auth_provider.dart';
import 'package:login_app/data/services/service_locator/service_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(
    ChangeNotifierProvider.value(
      value: getIt<AuthProvider>(),
      child: const Application(),
    ),
  );
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app/app/auth_provider/auth_provider.dart';

import 'package:login_app/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/auth_service.dart';
import '../network/dio/dio_client.dart';
import '../shared_prefs/shared_prefs.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(SharedPrefs(
    prefs: await SharedPreferences.getInstance(),
  ));
  getIt.registerSingleton(AuthService(client: getIt<DioClient>()));

  getIt.registerSingleton(AuthProvider(
    accessToken: getIt<SharedPrefs>().getAccessToken(),
    refreshToken: getIt<SharedPrefs>().getRefreshToken(),
    user: getIt<SharedPrefs>().getUser()?.isNotEmpty == true &&
            getIt<SharedPrefs>().getUser() != 'null'
        ? User.fromJson(jsonDecode(getIt<SharedPrefs>().getUser()!))
        : null,
  ));
}

import 'package:flutter/foundation.dart';
import 'package:login_app/data/services/service_locator/service_locator.dart';
import 'package:login_app/data/services/shared_prefs/shared_prefs.dart';

import '../../data/models/user.dart';

class AuthProvider with ChangeNotifier, DiagnosticableTreeMixin {
  AuthProvider({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  final sharedPrefs = getIt<SharedPrefs>();

  String? accessToken;
  String? refreshToken;
  User? user;

  setAuthData(String? accessToken, String? refreshToken, User? user) async {
    await sharedPrefs.setAccessToken(accessToken);
    await sharedPrefs.setRefreshToken(refreshToken);
    await sharedPrefs.setUser(user);
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    this.user = user;
    notifyListeners();
  }
}

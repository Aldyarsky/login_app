import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class SharedPrefs {
  final SharedPreferences prefs;
  SharedPrefs({required this.prefs});

  final String _accessToken = 'accessToken';
  final String _refreshToken = 'refreshToken';
  final String _user = 'user';

  String? getAccessToken() {
    final String? token = prefs.getString(_accessToken);
    return token;
  }

  setAccessToken(String? token) async {
    return await prefs.setString(_accessToken, token ?? '');
  }

  String? getRefreshToken() {
    final String? token = prefs.getString(_refreshToken);
    return token;
  }

  setRefreshToken(String? token) async {
    return await prefs.setString(_refreshToken, token ?? '');
  }

  String? getUser() {
    final String? user = prefs.getString(_user);
    return user;
  }

  setUser(User? user) async {
    if (user == null) return await prefs.setString(_user, '');
    final userAsString = jsonEncode(user.toJson());
    return await prefs.setString(_user, userAsString);
  }
}

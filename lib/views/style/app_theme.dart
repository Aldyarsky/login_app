import 'package:flutter/cupertino.dart';
import 'package:login_app/views/style/app_colors.dart';

class AppTheme {
  AppTheme({required this.context});
  final BuildContext context;

  CupertinoThemeData get lightTheme {
    return const CupertinoThemeData(
      scaffoldBackgroundColor: AppColors.grayBg,
      primaryColor: AppColors.purple,
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(
          fontSize: 15,
          fontFamily: 'Monrope',
          color: CupertinoColors.black,
        ),
        textStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Monrope',
          color: CupertinoColors.black,
        ),
      ),
    );
  }
}

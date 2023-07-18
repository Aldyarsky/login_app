import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:login_app/app/auth_provider/auth_provider.dart';

import 'package:login_app/views/style/app_colors.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          AppLocalizations.of(context)!.profile,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.profile_circled,
              size: 25.w,
              color: AppColors.black,
            ),
            Text(
              '${context.watch<AuthProvider>().user?.nickname}',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              '${context.watch<AuthProvider>().user?.email}',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 28),
            Container(
              width: 100.w,
              alignment: Alignment.centerLeft,
              color: AppColors.whiteBg,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CupertinoButton(
                child: Text(
                  AppLocalizations.of(context)!.logout,
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            color: CupertinoColors.destructiveRed,
                          ),
                ),
                onPressed: () {
                  context.read<AuthProvider>().setAuthData(null, null, null);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

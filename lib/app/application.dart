import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:login_app/app/auth_provider/auth_provider.dart';
import 'package:login_app/app/routing/navigator_keys.dart';
import 'package:login_app/app/routing/route_names.dart';

import 'package:login_app/views/style/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/models/user.dart';
import '../views/pages/auth/login/login_view.dart';
import '../views/pages/not_implemented/not_implemented_view.dart';
import '../views/pages/profile/profile_view.dart';
import '../views/widgets/scaffold_with_bottom_nav.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.watch<AuthProvider>().user;

    final GoRouter goRouter = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        if (user == null) {
          return '/auth/login';
        }
        if (state.location == '/') {
          return '/profile';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/auth',
          redirect: (context, state) {
            return '/auth/login';
          },
          routes: [
            GoRoute(
              name: RouteNames.login,
              path: 'login',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: LoginView());
              },
            ),
            GoRoute(
              name: RouteNames.register,
              path: 'register',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: Container());
              },
            ),
          ],
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithBottomNav(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/feed',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: NotImplementedView());
              },
            ),
            GoRoute(
              path: '/map',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: NotImplementedView());
              },
            ),
            GoRoute(
              path: '/favourites',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: NotImplementedView());
              },
            ),
            GoRoute(
              name: RouteNames.profile,
              path: '/profile',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ProfileView());
              },
            ),
          ],
        ),
      ],
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GlobalLoaderOverlay(
          child: CupertinoApp.router(
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
          ),
        );
      },
    );
  }
}

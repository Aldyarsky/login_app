import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/routing/route_names.dart';
import 'package:login_app/views/auth/login/login_view.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/auth',
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
            return NoTransitionPage(child: LoginView());
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
  ],
);

import 'package:flutter/material.dart';
import 'package:flutter_bloc_training/page/counter.dart';
import 'package:flutter_bloc_training/page/error.dart';
import 'package:flutter_bloc_training/page/login.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static GoRouter returnRouter(bool isAuth) {
    final router = GoRouter(
      initialLocation: "/",
      routerNeglect: true,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/',
          name: 'login',
          builder: (BuildContext context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (BuildContext context, state) => const CounterPage(),
        ),
      ],
      errorPageBuilder: (BuildContext context, state) {
        return const MaterialPage(child: ErrorPage());
      },
      // redirect: (BuildContext context, state) {
      //   if (!isAuth) return '/';
      //   return '/home';
      // },
    );
    return router;
  }
}

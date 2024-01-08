import 'package:flutter/material.dart';
import 'package:flutter_bloc_training/page/home.dart';
import 'package:flutter_bloc_training/page/login.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          pageBuilder: (context, state) =>
              const MaterialPage(child: MyHomePage(title: "HomePage")),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginPage()),
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: LoginPage());
      },
      redirect: (context, state) {
        if (!isAuth) {
          return context.namedLocation('login');
        } else {
          return context.namedLocation('login');
        }
      },
    );
    return router;
  }
}

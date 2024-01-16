import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_training/app_route.dart';
import 'package:flutter_bloc_training/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_training/bloc/app_observer.dart';
import 'package:flutter_bloc_training/bloc/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_training/page/counter.dart';
import 'package:flutter_bloc_training/page/error.dart';
import 'package:flutter_bloc_training/page/login.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  Bloc.observer = const AppObserver();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppViewState();
}

class _AppViewState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final counterBloc =
        BlocProvider<CounterBloc>(create: (context) => CounterBloc());
    final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc());

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

    return MultiBlocProvider(
      providers: [counterBloc, loginBloc],
      child: MaterialApp.router(
        routerConfig: AppRoute.returnRouter(false),
        title: 'Flutter Training',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

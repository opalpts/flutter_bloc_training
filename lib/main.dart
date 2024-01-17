import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_training/app_route.dart';
import 'package:flutter_bloc_training/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_training/bloc/app_observer.dart';
import 'package:flutter_bloc_training/bloc/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_training/model/login_modal.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

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
    final loginInfo = LoginInfo();
    final counterBloc =
        BlocProvider<CounterBloc>(create: (context) => CounterBloc());
    final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc());
    final loggedIn = loginInfo.loggedIn;
    print(loggedIn);
    return ChangeNotifierProvider<LoginInfo>.value(
        value: loginInfo,
        child: MultiBlocProvider(
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
        ));
  }
}

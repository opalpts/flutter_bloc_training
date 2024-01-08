import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_training/app_route.dart';
import 'package:flutter_bloc_training/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_training/bloc/counter_observer.dart';
import 'package:flutter_bloc_training/page/home.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todosBloc =
        BlocProvider<CounterBloc>(create: (context) => CounterBloc());

    // final _router = GoRouter(
    //   initialLocation: '/',
    //   routes: [
    //     GoRoute(
    //       name: 'home',
    //       path: '/',
    //       builder: (context, state) => const MyHomePage(title: "HomePage"),
    //     ),
    //     GoRoute(
    //       name: 'login',
    //       path: '/login',
    //       builder: (context, state) => const LoginPage(
    //         title: "LoginPage",
    //       ),
    //     ),
    //   ],
    // );
    return MultiBlocProvider(
      providers: [todosBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'HomePage'),
        // routeInformationParser:
        //     AppRoute.returnRouter(false).routeInformationParser,
        // routerDelegate: AppRoute.returnRouter(false).routerDelegate,
      ),
    );
  }
}

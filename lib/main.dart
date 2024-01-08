import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_training/app_route.dart';
import 'package:flutter_bloc_training/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_training/bloc/app_observer.dart';
import 'package:flutter_bloc_training/bloc/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_training/page/home.dart';
import 'package:flutter_bloc_training/page/login.dart';

void main() {
  Bloc.observer = const AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc =
        BlocProvider<CounterBloc>(create: (context) => CounterBloc());
    final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc());

    return MultiBlocProvider(
      providers: [counterBloc, loginBloc],
      child: MaterialApp(
        title: 'Flutter Training',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

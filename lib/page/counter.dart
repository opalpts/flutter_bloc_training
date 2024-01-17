import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_training/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_training/bloc/login/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'logout',
            onPressed: () {
              context.goNamed('login');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              final username = context.select(
                (LoginBloc bloc) => bloc.state.username,
              );
              return Text('สวัสดีคุณ: $username',
                  style: Theme.of(context).textTheme.displayMedium);
            },
          ),
          const SizedBox(height: 40),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (BuildContext context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Counter:',
                    ),
                    Text(
                      '${state.count}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterEventReset()),
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(CounterEventAdd()),
            tooltip: 'Add',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterEventRemove()),
            tooltip: 'Remove',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

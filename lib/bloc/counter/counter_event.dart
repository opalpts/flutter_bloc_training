part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class CounterAEventAdd extends CounterEvent {}

class CounterAEventReset extends CounterEvent {}

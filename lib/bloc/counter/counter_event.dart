part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class CounterEventAdd extends CounterEvent {}

class CounterEventRemove extends CounterEvent {}

class CounterEventReset extends CounterEvent {}

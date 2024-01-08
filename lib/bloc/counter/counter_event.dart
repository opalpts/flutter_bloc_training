part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  CounterEvent();

  List<Object?> get props => [];
}

class Equatable {}

class CounterAEventAdd extends CounterEvent {}

class CounterAEventReset extends CounterEvent {}

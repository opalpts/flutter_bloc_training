import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    // Add Event
    on<CounterAEventAdd>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    // Reset Event
    on<CounterAEventReset>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0)) {
    // Add Event
    on<CounterEventAdd>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    // Remove Event
    on<CounterEventRemove>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });

    // Reset Event
    on<CounterEventReset>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }
}

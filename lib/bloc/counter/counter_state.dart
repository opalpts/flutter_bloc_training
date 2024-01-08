part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  CounterState({required this.count});
  final int count;

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  @override
  String toString() {
    return "count: $count";
  }

  List<Object> get props => [count];
}

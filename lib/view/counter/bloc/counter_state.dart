// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class TheNumberIncreased extends CounterState {
  final int counter;
  TheNumberIncreased({
    required this.counter,
  });
}

class TheNumberDecreased extends CounterState {
  final int counter;
  TheNumberDecreased({
    required this.counter,
  });
}

class InvalidValue extends CounterState {
 final int lastValue;
  InvalidValue({
    required this.lastValue,
  });
}

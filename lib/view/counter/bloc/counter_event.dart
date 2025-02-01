// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class Increament extends CounterEvent {}

class Decreament extends CounterEvent {}

class ChangeValueFromTextField extends CounterEvent {
 final String? counterValue;
  ChangeValueFromTextField({
    this.counterValue,
  });
}

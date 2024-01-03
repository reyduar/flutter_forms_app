part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {
  final int value;
  const IncrementCounter(this.value);
}

class ResetCounter extends CounterEvent {}

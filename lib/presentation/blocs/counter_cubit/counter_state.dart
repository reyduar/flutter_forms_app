part of 'counter_cubit.dart';

// Se implemento Equatable para determinar si el estado cambio y si no no actualiza el widget 
// donde esta implementado el state
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  copyWith({
    int? counter,
    int? transactionCount,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }

  @override
  List<Object?> get props => [counter, transactionCount];
}

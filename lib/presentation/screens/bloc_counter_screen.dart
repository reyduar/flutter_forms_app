import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(IncrementCounter(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: context.select((CounterBloc bloc) =>
              Text('Bloc Counter ${bloc.state.transactionCount}')),
          actions: [
            IconButton(
              onPressed: () => context.read<CounterBloc>().add(ResetCounter()),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
            child: context.select((CounterBloc counterBloc) =>
                Text('Counter value: ${counterBloc.state.counter}'))),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 1,
              onPressed: () => increaseCounterBy(context, 3),
              tooltip: 'Increment',
              child: const Text('+3'),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 2,
              onPressed: () => increaseCounterBy(context, 2),
              tooltip: 'Decrement',
              child: const Text('+2'),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 3,
              onPressed: () => increaseCounterBy(context),
              tooltip: 'Decrement',
              child: const Text('+1'),
            ),
          ],
        ));
  }
}

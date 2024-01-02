import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCunterView());
  }
}

class _CubitCunterView extends StatelessWidget {
  const _CubitCunterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increment(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cubit Counter: ${counterState.transactionCount}'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                // buildWhen: (previous, current) => current.counter != previous.counter,
                builder: (context, state) {
                  return Text(
                    'Cubit Counter: ${state.counter}',
                  );
                },
              ),
            ],
          ),
        ),
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

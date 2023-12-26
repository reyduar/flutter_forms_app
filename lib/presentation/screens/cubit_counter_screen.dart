import 'package:flutter/material.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit Counter'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cubit Counter: xxxxx',
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 1,
              onPressed: () {},
              tooltip: 'Increment',
              child: const Text('+3'),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 2,
              onPressed: () {},
              tooltip: 'Decrement',
              child: const Text('+2'),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 3,
              onPressed: () {},
              tooltip: 'Decrement',
              child: const Text('+1'),
            ),
          ],
        ));
  }
}
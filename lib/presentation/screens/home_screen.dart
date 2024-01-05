import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubit'),
            subtitle: const Text('Simple State Manager'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('BloC/Flutter BloC'),
            subtitle: const Text('Composite State Manager'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/blocs'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Form Register'),
            subtitle: const Text('Simple form'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}

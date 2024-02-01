import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldPage extends StatelessWidget {
  final Widget child;

  const ScaffoldPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.push('/profile');
            },
          ),
        ],
      ),
      body: child,
    );
  }
}

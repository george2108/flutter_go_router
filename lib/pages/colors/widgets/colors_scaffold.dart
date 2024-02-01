import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorsScaffoldPage extends StatefulWidget {
  final Widget child;

  const ColorsScaffoldPage({super.key, required this.child});

  @override
  State<ColorsScaffoldPage> createState() => _ColorsScaffoldPageState();
}

class _ColorsScaffoldPageState extends State<ColorsScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          String color = 'red';
          if (value == 0) color = 'red';
          if (value == 1) color = 'blue';
          if (value == 2) color = 'green';

          GoRouter.of(context).go('/$color');
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.red,
            ),
            label: 'red',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.blue,
            ),
            label: 'blue',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.green,
            ),
            label: 'green',
          ),
        ],
      ),
    );
  }
}

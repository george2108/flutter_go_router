import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  final GoRouterState goRouterState;

  const NotFoundPage({super.key, required this.goRouterState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              width: 300,
              height: 300,
              child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(
                  'https://static-00.iconduck.com/assets.00/404-page-not-found-illustration-2048x998-yjzeuy4v.png',
                ),
              ),
            ),
            Text(goRouterState.error.toString()),
            const SizedBox(height: 20),
            FilledButton(
              child: const Text('Volver al inicio'),
              onPressed: () {
                // cuando es una ruta por error hay que hacer el go para eliminar el historial de rutas
                GoRouter.of(context).go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}

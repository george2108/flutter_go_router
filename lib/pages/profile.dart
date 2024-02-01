import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/global/session_controller.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Cerrar sesión'),
          onPressed: () {
            context.read<SessionController>().setSignedIn(false);
            context.go('/');
          },
        ),
      ),
    );
  }
}

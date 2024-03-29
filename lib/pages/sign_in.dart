import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/global/session_controller.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final String redirectUrl;

  const SignInPage({super.key, required this.redirectUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Iniciar sesión'),
          onPressed: () {
            context.read<SessionController>().setSignedIn(true);
            GoRouter.of(context).pushReplacement(redirectUrl);
          },
        ),
      ),
    );
  }
}

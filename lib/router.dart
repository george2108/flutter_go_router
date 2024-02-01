import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/global/session_controller.dart';
import 'package:go_router_flutter/pages/home/details.dart';
import 'package:go_router_flutter/pages/home/home.dart';
import 'package:go_router_flutter/pages/home/scaffold.dart';
import 'package:go_router_flutter/pages/my_app.dart';
import 'package:go_router_flutter/pages/not_found.dart';
import 'package:go_router_flutter/pages/profile.dart';
import 'package:go_router_flutter/pages/sign_in.dart';
import 'package:provider/provider.dart';

mixin RouterMixin on State<MyApp> {
  final _router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return NotFoundPage(
        goRouterState: state,
      );
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/detail/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return DetailsPage(id: int.parse(id));
            },
            redirect: (context, state) => authGuard(
              context: context,
              state: state,
              redirectUrl: '/detail/${state.pathParameters['id']}',
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const ProfilePage();
        },
        // sirve para hacer evaluaciones si queremos comprobar algo antes de ejecutar la ruta
        // como los guards de angular
        redirect: (context, state) => authGuard(
          context: context,
          state: state,
          redirectUrl: '/profile',
        ),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) {
          final redirectUrl = state.uri.queryParameters['redirectUrl'];
          return SignInPage(
            redirectUrl: redirectUrl ?? '/',
          );
        },
        redirect: (context, state) {
          final signedId = context.read<SessionController>().isSignedIn;
          if (signedId) {
            return '/';
          }

          return null;
        },
      ),
    ],
  );

  GoRouter get router => _router;
}

FutureOr<String?> authGuard({
  required BuildContext context,
  required GoRouterState state,
  required String redirectUrl,
}) async {
  final signedId = context.read<SessionController>().isSignedIn;
  if (signedId) {
    return null;
  }

  return '/sign-in?redirectUrl=$redirectUrl';
}

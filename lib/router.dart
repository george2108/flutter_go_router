import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/global/session_controller.dart';
import 'package:go_router_flutter/pages/details.dart';
import 'package:go_router_flutter/pages/home.dart';
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
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const ProfilePage();
        },
        // sirve para hacer evaluaciones si queremos comprobar algo antes de ejecutar la ruta
        // como los guards de angular
        redirect: (context, state) async {
          final signedId = context.read<SessionController>().isSignedIn;
          if (signedId) {
            return null;
          }

          return '/sign-in';
        },
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) {
          return const SignInPage();
        },
        redirect: (context, state) {
          final signedId = context.read<SessionController>().isSignedIn;
          if (signedId) {
            return '/';
          }

          return null;
        },
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailsPage(id: int.parse(id));
        },
      ),
    ],
  );

  GoRouter get router => _router;
}

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/pages/details.dart';
import 'package:go_router_flutter/pages/home.dart';
import 'package:go_router_flutter/pages/my_app.dart';
import 'package:go_router_flutter/pages/not_found.dart';

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

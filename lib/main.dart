import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/global/session_controller.dart';
import 'package:go_router_flutter/pages/my_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    Provider<SessionController>(
      create: (context) => SessionController(preferences),
      child: MyApp(),
    ),
  );
}

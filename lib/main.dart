import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/pages/my_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MyApp());
}

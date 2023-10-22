import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_app/presentation/page/auth/auth_screen.dart';
import 'package:health_app/presentation/theme.dart';
import 'package:health_app/core/injector.dart' as di;

void main() {
  runZonedGuarded(() async {
    await di.init();
    runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.themeData,
      home: const AuthScreen(),
    );
  }
}

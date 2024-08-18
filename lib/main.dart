import 'package:flutter/material.dart';
import 'package:flutter_components_sdk/presentation/routes/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      title: 'Flutter App',
    );
  }
}

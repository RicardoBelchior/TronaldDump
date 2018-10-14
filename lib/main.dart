import 'package:flutter/material.dart';
import 'package:tronald_dump/injection/dependency_injection.dart';
import 'package:tronald_dump/routes.dart';

void main() {
  Injector.configure(Flavor.PROD);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tronald Dump',
      theme: _tronaldTheme,
      home: Routes.home(),
    );
  }
}

final ThemeData _tronaldTheme = _buildTheme();

ThemeData _buildTheme() {
  return ThemeData(
      brightness: Brightness.light, primaryColor: Colors.lightGreen);
}

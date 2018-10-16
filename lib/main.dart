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
    final ThemeData _tronaldTheme = _buildTheme(context);

    return MaterialApp(
      title: 'Tronald Dump',
      theme: _tronaldTheme,
      home: Routes.home(),
    );
  }
}

ThemeData _buildTheme(BuildContext context) {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange,
      primaryColorDark: Colors.deepOrange,
      accentColor: Colors.deepPurple,
      cardColor: Colors.grey[100],
      chipTheme: ChipTheme.of(context).copyWith(backgroundColor: Colors.orange[300]));
}

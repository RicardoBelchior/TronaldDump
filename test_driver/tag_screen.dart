import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:tronald_dump/injection/dependency_injection.dart';
import 'package:tronald_dump/main.dart';

void main() {
  Injector.configure(Flavor.MOCK);
  enableFlutterDriverExtension();
  runApp(MyApp());
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_mobe_task/ui/screen/home_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SmartMobe Task",
      home: HomeScreen(),
    );
  }
}

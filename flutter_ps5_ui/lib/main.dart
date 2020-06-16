import 'package:flutter/material.dart';
import 'package:flutter_ps5_ui/pages/DetailPage.dart';
import 'package:flutter_ps5_ui/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nobokek/commons/styles/themes.dart';
import 'package:flutter_nobokek/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Bokek',
      theme: appTheme,
      home: const MainPage(),
    );
  }
}

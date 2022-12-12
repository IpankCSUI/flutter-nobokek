import 'package:flutter/material.dart';
import 'package:flutter_nobokek/commons/styles/themes.dart';
import 'package:flutter_nobokek/page/login_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      
      child: MaterialApp(
        title: 'No Bokek',
        theme: ThemeData(
        primarySwatch: Colors.green,
        
      ),
        home: const LoginPage(),
      ),
      
    );
  }
}
import 'package:doan/home_screen.dart';
import 'package:doan/login/login.dart';
import 'package:doan/utils/app_variables.dart';
import 'package:doan/utils/prefs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Prefs.init();
    AppVariables.init();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

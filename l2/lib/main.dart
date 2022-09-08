import 'package:flutter/material.dart';
import 'package:l2/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0XFF121212),
        brightness: Brightness.dark,
      ),
      home: const LoginScreen(),
    );
  }
}

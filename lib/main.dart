import 'package:flutter/material.dart';
import 'package:sociable_hub/pages/login_page.dart';
import 'package:sociable_hub/theme/dark_mode.dart';
import 'package:sociable_hub/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}

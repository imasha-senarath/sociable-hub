import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sociable_hub/auth/login_or_register.dart';
import 'package:sociable_hub/pages/login_page.dart';
import 'package:sociable_hub/theme/dark_mode.dart';
import 'package:sociable_hub/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAbHcoG76S-XEcO-4ubT23EPT_zUbN5IlQ",
      messagingSenderId: "",
      projectId: "socialhub-6cc8a",
      appId: 'com.imasha.sociable_hub',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}

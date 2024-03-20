import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociable_hub/auth/login_or_register.dart';
import 'package:sociable_hub/pages/home_page.dart';

class AppAuth extends StatelessWidget {
  const AppAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegister();
          }
        }
      )
    );
  }
}

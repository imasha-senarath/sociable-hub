import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociable_hub/components/app_button.dart';
import 'package:sociable_hub/components/app_textfield.dart';

import '../helper/helper_functions.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Navigator.pop(context);
      showMessage("Fields can't be empty", context);
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showMessage(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Social Hub",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 35),
                AppTextField(
                  hintText: "Email",
                  controller: emailController,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                AppTextField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                AppButton(text: "Login", onTap: login),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

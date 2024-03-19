import 'package:flutter/material.dart';
import 'package:sociable_hub/components/app_button.dart';
import 'package:sociable_hub/components/app_textfield.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({Key? key, this.onTap}) : super(key: key);

  void register() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                hintText: "Username",
                controller: userNameController,
                obscureText: false,
              ),
              const SizedBox(height: 15),
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
              AppButton(text: "Register", onTap: register),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Login Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

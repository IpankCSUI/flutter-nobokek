import "package:flutter/material.dart";
import 'package:flutter_nobokek/widgets/white_text_field.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 5),
                Text(
                  "Please Register Here!",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 48),
                WhiteTextField(
                  onChanged: (text) {},
                  hintText: "Enter username",
                ),
                const SizedBox(height: 16),
                WhiteTextField(
                  onChanged: (text) {},
                  hintText: "Password",
                ),
                const SizedBox(height: 16),
                WhiteTextField(
                  onChanged: (text) {},
                  hintText: "Password confirmation",
                ),
                const SizedBox(height: 48),
                YellowButton(
                  label: "Register",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/page/main_page.dart';
import 'package:flutter_nobokek/page/register_page.dart';
import 'package:flutter_nobokek/widgets/white_text_field.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  bool isLoading = false;

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
                  "Welcome to NoBokek!",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text("Track your money, starting now!"),
                const SizedBox(height: 48),
                WhiteTextField(
                  onChanged: (text) {
                    username = text;
                  },
                  hintText: "Enter username",
                ),
                const SizedBox(height: 16),
                WhiteTextField(
                  onChanged: (text) {
                    password = text;
                  },
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      "Belum punya akun?",
                    ),
                    const Spacer(),
                    InkWell(
                      child: const Text("Sign Up"),
                      onTap: () => launch('https://nobokekk.up.railway.app/nobokek/register/')

                    )
                  ],
                ),
                const SizedBox(height: 48),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: ColorPalettes.freshLemon),
                      )
                    : YellowButton(
                        label: "Sign In",
                        onPressed: () {
                          if (username == null || password == null) {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text("ssss"),
                              ),
                            );
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            _signIn(username!, password!, context);
                          }
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn(
      String username, String password, BuildContext context) async {
    final request = Provider.of<CookieRequest>(context, listen: false);
    const url = "https://nobokekk.up.railway.app/nobokek/login-flutter/";
    final response = await request.login(url, {
      "username": username,
      "password": password,
    });
    if (response["status"] == false) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(title: Text("Akun belum terdaftar")),
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    }
    setState(() {
      isLoading = false;
    });
  }
}

/* 
* LOGIN PAGE
* On this page, an existing user can login with their 
* - email
* - password
* 
* -------------------------------------------------------
* 
* Once the user successfully logs in, they will be redirected to the home page.
* 
* If the user doesn't have an account yet, they can go to register page from here to create one
* 
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/components/my_button.dart';
import 'package:social_media/features/auth/presentation/components/my_text_field.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePage;
  const LoginPage({
    super.key,
    required this.togglePage,
  });
  // BUILD UI
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login buttin pressed
  void login() {
    // prepare email and pw
    final String email = emailController.text;
    final String password = passwordController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && password.isNotEmpty) {
      // Login
      authCubit.login(email, password);
    }

    // display error
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields"),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 50,
                ),
                // Welcome message
                Text(
                  "Welcome Back, You've been missed!!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyTextField(
                    controller: emailController,
                    hintText: ("Email"),
                    obscureText: false,
                  ),
                ),
                // Password text field
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: MyTextField(
                    controller: passwordController,
                    hintText: ("Password"),
                    obscureText: true,
                  ),
                ),
                // Login button
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: MyButton(
                      onTap: login,
                      text: "Login",
                    ),
                  ),
                ),
                // Don't havr an account?, register button
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: widget.togglePage,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
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

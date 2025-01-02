/* 
* REGISTER PAGE
* On this page, a new user can make their account with 
* - email
* - password
* 
* -------------------------------------------------------
* 
* Once the user successfully creates their account, they will be redirected to the login page.
* 
* If the user have an account, they can go to login page from here to login
* 
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/components/my_button.dart';
import 'package:social_media/features/auth/presentation/components/my_text_field.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({
    super.key,
    required this.togglePages,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void register() {
    // prepare email name and password
    final String email = emailController.text;
    final String name = nameController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // Check for fields are not empty
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        name.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      // passwords match
      if (password == confirmPassword) {
        //register
        authCubit.register(name, email, password);
      }
      // passwords don't match
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Passwords do not match"),
          ),
        );
      }
    }

    // Error if fields are empty
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
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  Icons.lock_outline,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 50,
                ),
                // Welcome message
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // Name text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyTextField(
                    controller: nameController,
                    hintText: ("Name"),
                    obscureText: false,
                  ),
                ),
                const SizedBox(
                  height: 10,
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

                // confrim password text field
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: MyTextField(
                    controller: confirmPasswordController,
                    hintText: ("Confirm Password"),
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
                      onTap: register,
                      text: "Register",
                    ),
                  ),
                ),
                // Have an account?, Login button
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ALready have a memeber?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
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

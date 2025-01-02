import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/data/firebase_auth_repo.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states.dart';
import 'package:social_media/features/auth/presentation/pages/auth_page.dart';
import 'package:social_media/features/home/presentation/pages/home_page.dart';
import 'package:social_media/theme/light_mode.dart';

/*
  APP - Root Level

----------------------------------------------------------------

  Repositories - For Database 
  - Firebase

  Bloc Providers - For state management
  - Auth
  - Profile
  - Post
  - Search
  - Theme

  Check Auth state
  - Unathenticated -> Auth page (Login/register)

  - authencticated -> Home page

*/

class MyApp extends StatelessWidget {
  // Auth Repo
  final authRepo = FirebaseAuthRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provide cubit to app
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(builder: (context, authState) {
          print("Auth state -> $authState");
          // Unathenticated -> Auth page (Login/register)
          if (authState is Unauthenticated) {
            return AuthPage();
          }

          // authenticated -> Home Page
          if (authState is Authenticated) {
            return HomePage();
          }

          // loading..
          else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
            // Listens for errors...
            listener: (context, authState) {
          if (authState is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(authState.message)));
          }
        }),
      ),
    );
  }
}

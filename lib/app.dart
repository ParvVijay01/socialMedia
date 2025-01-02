import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/data/firebase_auth_repo.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states.dart';
import 'package:social_media/features/auth/presentation/pages/auth_page.dart';
import 'package:social_media/features/home/presentation/pages/home_page.dart';
import 'package:social_media/features/profile/data/firebase_profile_repo.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_cubit.dart';
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

  // Profile repo
  final profileRepo = FirebaseProfileRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provide cubit to app
    return MultiBlocProvider(
      providers: [
        // Auth CUbit
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),

        // Profile Cubit
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(profileRepo: profileRepo),
        ),
      ],
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

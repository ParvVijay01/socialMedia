/*
*   Auth repo - outlines the possible auth ops for this app
*   This file only outlines the methods, the execution of the methods are done in the data layer
*/

import '../entities/app_user.dart';

abstract class AuthRepo{
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(String name,String email, String password);
  Future<void> logOut();
  Future<AppUser?> getCurrentUser();
}
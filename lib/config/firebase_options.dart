// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDvEf6gkNrAPStkZehbUQGrV1o4xSnZIEc',
    appId: '1:976819999261:web:63207a34c2367f6cdeecf4',
    messagingSenderId: '976819999261',
    projectId: 'socialmedia-47af8',
    authDomain: 'socialmedia-47af8.firebaseapp.com',
    storageBucket: 'socialmedia-47af8.firebasestorage.app',
    measurementId: 'G-8747YHH3PZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhmt7i7qa2nn_oOEJ3tzbZrjbZOR5AGvs',
    appId: '1:976819999261:android:f0f7a61615071c56deecf4',
    messagingSenderId: '976819999261',
    projectId: 'socialmedia-47af8',
    storageBucket: 'socialmedia-47af8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxdKVzUFLcLsyW7rzSf0IUiCPSMhgIBHg',
    appId: '1:976819999261:ios:af2d4087e13fa4c1deecf4',
    messagingSenderId: '976819999261',
    projectId: 'socialmedia-47af8',
    storageBucket: 'socialmedia-47af8.firebasestorage.app',
    iosBundleId: 'com.example.socialMedia',
  );
}
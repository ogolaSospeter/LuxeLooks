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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDYh2KxD6DZ6pYbpPB4FlQ3ZbgNVvS4yVY',
    appId: '1:279316290904:web:994991af8a179cf575992d',
    messagingSenderId: '279316290904',
    projectId: 'luxelooks-305b2',
    authDomain: 'luxelooks-305b2.firebaseapp.com',
    storageBucket: 'luxelooks-305b2.appspot.com',
    measurementId: 'G-G7PCTKKCXZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWXd4HbYddLsbMC19WY8L5YS8UlSUGugk',
    appId: '1:279316290904:android:6fc43e24ac28b6aa75992d',
    messagingSenderId: '279316290904',
    projectId: 'luxelooks-305b2',
    storageBucket: 'luxelooks-305b2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF8oZCxESqz5gVPHOP02x5eM0NkUMkJ8E',
    appId: '1:279316290904:ios:7a91459303f875f275992d',
    messagingSenderId: '279316290904',
    projectId: 'luxelooks-305b2',
    storageBucket: 'luxelooks-305b2.appspot.com',
    iosClientId: '279316290904-a8um6npfjjdov6uivqo7ct85u6qu4loo.apps.googleusercontent.com',
    iosBundleId: 'com.example.luxelooks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAF8oZCxESqz5gVPHOP02x5eM0NkUMkJ8E',
    appId: '1:279316290904:ios:7a91459303f875f275992d',
    messagingSenderId: '279316290904',
    projectId: 'luxelooks-305b2',
    storageBucket: 'luxelooks-305b2.appspot.com',
    iosClientId: '279316290904-a8um6npfjjdov6uivqo7ct85u6qu4loo.apps.googleusercontent.com',
    iosBundleId: 'com.example.luxelooks',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYh2KxD6DZ6pYbpPB4FlQ3ZbgNVvS4yVY',
    appId: '1:279316290904:web:8181b601ccb5f3c175992d',
    messagingSenderId: '279316290904',
    projectId: 'luxelooks-305b2',
    authDomain: 'luxelooks-305b2.firebaseapp.com',
    storageBucket: 'luxelooks-305b2.appspot.com',
    measurementId: 'G-37KP1MH923',
  );
}
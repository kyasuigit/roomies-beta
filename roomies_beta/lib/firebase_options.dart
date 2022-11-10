// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBiNbu3hPu46ChL6nV9StO85-IB6O7r6rE',
    appId: '1:345685335313:web:88f09a5a4ee97ea96700b0',
    messagingSenderId: '345685335313',
    projectId: 'roommate-app-562f3',
    authDomain: 'roommate-app-562f3.firebaseapp.com',
    storageBucket: 'roommate-app-562f3.appspot.com',
    measurementId: 'G-ZEE6QKV1PP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWvSiK7aLSh5KTaJKhTuB5bsy0opFnLXM',
    appId: '1:345685335313:android:3c4ad6bec05b4a7b6700b0',
    messagingSenderId: '345685335313',
    projectId: 'roommate-app-562f3',
    storageBucket: 'roommate-app-562f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMcqecXhx0dZjUE2SNeAmGKugJQzydXW0',
    appId: '1:345685335313:ios:2dc5edec02080d3e6700b0',
    messagingSenderId: '345685335313',
    projectId: 'roommate-app-562f3',
    storageBucket: 'roommate-app-562f3.appspot.com',
    iosClientId: '345685335313-j16js2tsccr44jfc9m4eb8i37098hjdj.apps.googleusercontent.com',
    iosBundleId: 'com.example.roomiesBeta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMcqecXhx0dZjUE2SNeAmGKugJQzydXW0',
    appId: '1:345685335313:ios:2dc5edec02080d3e6700b0',
    messagingSenderId: '345685335313',
    projectId: 'roommate-app-562f3',
    storageBucket: 'roommate-app-562f3.appspot.com',
    iosClientId: '345685335313-j16js2tsccr44jfc9m4eb8i37098hjdj.apps.googleusercontent.com',
    iosBundleId: 'com.example.roomiesBeta',
  );
}

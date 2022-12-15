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
    apiKey: 'AIzaSyDcnnxqM9n3ydkr-1AI6jGppx4FH4Gf4no',
    appId: '1:723752730927:web:584e1a15574dc2a9b5e1da',
    messagingSenderId: '723752730927',
    projectId: 'filmes-sm',
    authDomain: 'filmes-sm.firebaseapp.com',
    storageBucket: 'filmes-sm.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1tFz2iOon_oR8SeQGlWZAV5DdVBA8mWE',
    appId: '1:723752730927:android:49d3941639d57269b5e1da',
    messagingSenderId: '723752730927',
    projectId: 'filmes-sm',
    storageBucket: 'filmes-sm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbZS1-2B4C0B9zFnSnkt7UcR1P7F7RwB0',
    appId: '1:723752730927:ios:f8b2a9de3fe9e655b5e1da',
    messagingSenderId: '723752730927',
    projectId: 'filmes-sm',
    storageBucket: 'filmes-sm.appspot.com',
    androidClientId:
        '723752730927-rehv7vgmn2nhie7rbc2c6pgpc00ilov9.apps.googleusercontent.com',
    iosClientId:
        '723752730927-kom5cno3mlk7m3trf7pmht12o4h1ej2p.apps.googleusercontent.com',
    iosBundleId: 'com.example.filmesSoumei',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbZS1-2B4C0B9zFnSnkt7UcR1P7F7RwB0',
    appId: '1:723752730927:ios:f8b2a9de3fe9e655b5e1da',
    messagingSenderId: '723752730927',
    projectId: 'filmes-sm',
    storageBucket: 'filmes-sm.appspot.com',
    androidClientId:
        '723752730927-rehv7vgmn2nhie7rbc2c6pgpc00ilov9.apps.googleusercontent.com',
    iosClientId:
        '723752730927-kom5cno3mlk7m3trf7pmht12o4h1ej2p.apps.googleusercontent.com',
    iosBundleId: 'com.example.filmesSoumei',
  );
}

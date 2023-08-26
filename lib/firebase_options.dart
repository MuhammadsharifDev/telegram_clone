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
    apiKey: 'AIzaSyDh26n3_jlZvaKHLB17EXI5D6SvHEokxEg',
    appId: '1:273238032035:web:3e2e1b4724b9ade9bc0916',
    messagingSenderId: '273238032035',
    projectId: 'telegram-clone-559cd',
    authDomain: 'telegram-clone-559cd.firebaseapp.com',
    storageBucket: 'telegram-clone-559cd.appspot.com',
    measurementId: 'G-SRG934W3GK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnQJxkYwJvA0JrewniB5IePHUwuYr1o2o',
    appId: '1:273238032035:android:6b0eb2d5d234159ebc0916',
    messagingSenderId: '273238032035',
    projectId: 'telegram-clone-559cd',
    storageBucket: 'telegram-clone-559cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvEZ-7kiqffUxOyBCDf4uyRe5of-MQn9M',
    appId: '1:273238032035:ios:2843e15f01e0da4fbc0916',
    messagingSenderId: '273238032035',
    projectId: 'telegram-clone-559cd',
    storageBucket: 'telegram-clone-559cd.appspot.com',
    iosClientId: '273238032035-hcpkn1i3jig2nq7m376ccqiv7cpumpvb.apps.googleusercontent.com',
    iosBundleId: 'com.example.telegramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvEZ-7kiqffUxOyBCDf4uyRe5of-MQn9M',
    appId: '1:273238032035:ios:fc862824e9997d6abc0916',
    messagingSenderId: '273238032035',
    projectId: 'telegram-clone-559cd',
    storageBucket: 'telegram-clone-559cd.appspot.com',
    iosClientId: '273238032035-cspjl26kkjuetkc9tfh0cdcljav0s56o.apps.googleusercontent.com',
    iosBundleId: 'com.example.telegramClone.RunnerTests',
  );
}
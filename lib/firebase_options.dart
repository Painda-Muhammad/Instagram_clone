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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzKJylFeePzkQUexRrdoJP5VQhtIatDjM',
    appId: '1:1059316989966:android:c86cfca21e268c00f3fc5f',
    messagingSenderId: '1059316989966',
    projectId: 'flutter-medical-app-3c705',
    storageBucket: 'flutter-medical-app-3c705.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQwfq4DWLTuStH-nCAcQXW87ke8NIZLro',
    appId: '1:1059316989966:ios:04d0ca03ea6265acf3fc5f',
    messagingSenderId: '1059316989966',
    projectId: 'flutter-medical-app-3c705',
    storageBucket: 'flutter-medical-app-3c705.appspot.com',
    androidClientId: '1059316989966-jv5d5dkkklg8lfkej9648opg3dm7empg.apps.googleusercontent.com',
    iosClientId: '1059316989966-b1c0qrgc3h8hfnnnonp8h62gjiko879j.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramCloneApp',
  );
}

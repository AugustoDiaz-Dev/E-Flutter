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
    apiKey: 'AIzaSyBU9BeYZcCPZx9vxRSVhmqMFphFReS6DkE',
    appId: '1:568217545759:web:d6816a35668e4775feb92a',
    messagingSenderId: '568217545759',
    projectId: 'add-firebase-to-your-flutter',
    authDomain: 'add-firebase-to-your-flutter.firebaseapp.com',
    storageBucket: 'add-firebase-to-your-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJ7VO9_J47TgRIFC64lG938EwexLgbzXY',
    appId: '1:568217545759:android:50670a1d89fe09c9feb92a',
    messagingSenderId: '568217545759',
    projectId: 'add-firebase-to-your-flutter',
    storageBucket: 'add-firebase-to-your-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoMp83Gbxs0xmQJcy5ZmPj10xKLqo3vcY',
    appId: '1:568217545759:ios:e42052686016eac6feb92a',
    messagingSenderId: '568217545759',
    projectId: 'add-firebase-to-your-flutter',
    storageBucket: 'add-firebase-to-your-flutter.appspot.com',
    iosClientId: '568217545759-cidctt8ij9m40mt2emb79kr5phgu2rqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.addFirebaseToYourFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoMp83Gbxs0xmQJcy5ZmPj10xKLqo3vcY',
    appId: '1:568217545759:ios:5f292b973a50d4d1feb92a',
    messagingSenderId: '568217545759',
    projectId: 'add-firebase-to-your-flutter',
    storageBucket: 'add-firebase-to-your-flutter.appspot.com',
    iosClientId: '568217545759-lvdkk2maou3g2ec1pbt5l33m14hsmss3.apps.googleusercontent.com',
    iosBundleId: 'com.example.addFirebaseToYourFlutterApp.RunnerTests',
  );
}

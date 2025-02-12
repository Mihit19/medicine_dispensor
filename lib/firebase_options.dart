
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
    apiKey: 'AIzaSyDjCiNdNmNW9mDmLKDgUg5qwoPPwyWFK5w',
    appId: '1:225668127919:web:831a492055e60113f1485a',
    messagingSenderId: '225668127919',
    projectId: 'apptofiretorasbpi',
    authDomain: 'apptofiretorasbpi.firebaseapp.com',
    databaseURL: 'https://apptofiretorasbpi-default-rtdb.firebaseio.com',
    storageBucket: 'apptofiretorasbpi.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkOLM9J8g_euC1pFsNy-UR2GjcIG5F-qA',
    appId: '1:225668127919:android:a3392824cf5e7dcef1485a',
    messagingSenderId: '225668127919',
    projectId: 'apptofiretorasbpi',
    databaseURL: 'https://apptofiretorasbpi-default-rtdb.firebaseio.com',
    storageBucket: 'apptofiretorasbpi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgTTj3LxC7UL8m2Hg8WYz797RvLujqPdY',
    appId: '1:225668127919:ios:764b3c1445046820f1485a',
    messagingSenderId: '225668127919',
    projectId: 'apptofiretorasbpi',
    databaseURL: 'https://apptofiretorasbpi-default-rtdb.firebaseio.com',
    storageBucket: 'apptofiretorasbpi.appspot.com',
    iosBundleId: 'com.example.apptofiretorasbpi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgTTj3LxC7UL8m2Hg8WYz797RvLujqPdY',
    appId: '1:225668127919:ios:764b3c1445046820f1485a',
    messagingSenderId: '225668127919',
    projectId: 'apptofiretorasbpi',
    databaseURL: 'https://apptofiretorasbpi-default-rtdb.firebaseio.com',
    storageBucket: 'apptofiretorasbpi.appspot.com',
    iosBundleId: 'com.example.apptofiretorasbpi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjCiNdNmNW9mDmLKDgUg5qwoPPwyWFK5w',
    appId: '1:225668127919:web:692ad025f012b18bf1485a',
    messagingSenderId: '225668127919',
    projectId: 'apptofiretorasbpi',
    authDomain: 'apptofiretorasbpi.firebaseapp.com',
    databaseURL: 'https://apptofiretorasbpi-default-rtdb.firebaseio.com',
    storageBucket: 'apptofiretorasbpi.appspot.com',
  );

}
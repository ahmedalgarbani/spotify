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
    apiKey: 'AIzaSyBFxycMLnFSCqYZ4Z9lAsL4KCH0RDtzz4M',
    appId: '1:961779147097:web:8e0e3745f70fa9e87eec48',
    messagingSenderId: '961779147097',
    projectId: 'spotify-e0c82',
    authDomain: 'spotify-e0c82.firebaseapp.com',
    databaseURL: 'https://spotify-e0c82-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-e0c82.appspot.com',
    measurementId: 'G-N3MK2L0MKM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDS5GJG31bsCetGKGX9OFEJkg3mDHeFge0',
    appId: '1:961779147097:android:41b93e68acec365a7eec48',
    messagingSenderId: '961779147097',
    projectId: 'spotify-e0c82',
    databaseURL: 'https://spotify-e0c82-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-e0c82.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJaQqVAtxJ0cvzHqqQUsV090IWLHLEMAA',
    appId: '1:961779147097:ios:f2f239c3d41d2f537eec48',
    messagingSenderId: '961779147097',
    projectId: 'spotify-e0c82',
    databaseURL: 'https://spotify-e0c82-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-e0c82.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJaQqVAtxJ0cvzHqqQUsV090IWLHLEMAA',
    appId: '1:961779147097:ios:f2f239c3d41d2f537eec48',
    messagingSenderId: '961779147097',
    projectId: 'spotify-e0c82',
    databaseURL: 'https://spotify-e0c82-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-e0c82.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFxycMLnFSCqYZ4Z9lAsL4KCH0RDtzz4M',
    appId: '1:961779147097:web:75f61218eaa720eb7eec48',
    messagingSenderId: '961779147097',
    projectId: 'spotify-e0c82',
    authDomain: 'spotify-e0c82.firebaseapp.com',
    databaseURL: 'https://spotify-e0c82-default-rtdb.firebaseio.com',
    storageBucket: 'spotify-e0c82.appspot.com',
    measurementId: 'G-93M8LFKMXB',
  );
}

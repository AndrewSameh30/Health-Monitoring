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
    apiKey: 'AIzaSyDqgm5xDogs5u6v7VyK9BiR8VKrlLZJNCI',
    appId: '1:925095354689:web:11552be52e4a0b99e681c0',
    messagingSenderId: '925095354689',
    projectId: 'health-monitoring-afb77',
    authDomain: 'health-monitoring-afb77.firebaseapp.com',
    databaseURL: 'https://health-monitoring-afb77-default-rtdb.firebaseio.com',
    storageBucket: 'health-monitoring-afb77.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5Ly7TyuqFgp9nRIMri385equeC7WN4Cs',
    appId: '1:925095354689:android:58cd16d467d818c1e681c0',
    messagingSenderId: '925095354689',
    projectId: 'health-monitoring-afb77',
    databaseURL: 'https://health-monitoring-afb77-default-rtdb.firebaseio.com',
    storageBucket: 'health-monitoring-afb77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfLu82rpKr81GH4uTzjkxYqCPVAgPputc',
    appId: '1:925095354689:ios:0f161e71385bec45e681c0',
    messagingSenderId: '925095354689',
    projectId: 'health-monitoring-afb77',
    databaseURL: 'https://health-monitoring-afb77-default-rtdb.firebaseio.com',
    storageBucket: 'health-monitoring-afb77.appspot.com',
    iosClientId: '925095354689-9u70vk62kuo8cspndtr0ju7lr8aiffpt.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfLu82rpKr81GH4uTzjkxYqCPVAgPputc',
    appId: '1:925095354689:ios:0f161e71385bec45e681c0',
    messagingSenderId: '925095354689',
    projectId: 'health-monitoring-afb77',
    databaseURL: 'https://health-monitoring-afb77-default-rtdb.firebaseio.com',
    storageBucket: 'health-monitoring-afb77.appspot.com',
    iosClientId: '925095354689-9u70vk62kuo8cspndtr0ju7lr8aiffpt.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstApp',
  );
}

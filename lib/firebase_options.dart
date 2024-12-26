// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBvT2J2Z-r2NvY5WuzBTBXd14Z7BAGKA1o',
    appId: '1:824768837432:web:cf7b0977ca7c4e5bbb33cd',
    messagingSenderId: '824768837432',
    projectId: 'smartspend-6bb70',
    authDomain: 'smartspend-6bb70.firebaseapp.com',
    storageBucket: 'smartspend-6bb70.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzelNOFtxOZP04JP3IX0S34IIazJRXLes',
    appId: '1:824768837432:android:f6c06761b463da78bb33cd',
    messagingSenderId: '824768837432',
    projectId: 'smartspend-6bb70',
    storageBucket: 'smartspend-6bb70.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHw-jzTw8AvyWVaf3IRlDPAMQ-UU61qMU',
    appId: '1:824768837432:ios:f2c28680080b9849bb33cd',
    messagingSenderId: '824768837432',
    projectId: 'smartspend-6bb70',
    storageBucket: 'smartspend-6bb70.firebasestorage.app',
    iosBundleId: 'com.example.smartSpend',
  );
}

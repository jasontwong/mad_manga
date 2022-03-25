// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBFPWxU-4Ae9TK78P_69wlTH9ku37uPDw4',
    appId: '1:275682877590:web:02df966094e4b70002e2b7',
    messagingSenderId: '275682877590',
    projectId: 'mad-manga-78540',
    authDomain: 'mad-manga-78540.firebaseapp.com',
    storageBucket: 'mad-manga-78540.appspot.com',
    measurementId: 'G-FTKYLR32C0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgc1yfAlYFSDXXL0IUnC6OlJpFGWRrtwo',
    appId: '1:275682877590:android:a09d270532aa005802e2b7',
    messagingSenderId: '275682877590',
    projectId: 'mad-manga-78540',
    storageBucket: 'mad-manga-78540.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdLYJli3DBKHWCgukpGsT-HhkfSf0ZQko',
    appId: '1:275682877590:ios:b9c217473e10731502e2b7',
    messagingSenderId: '275682877590',
    projectId: 'mad-manga-78540',
    storageBucket: 'mad-manga-78540.appspot.com',
    iosClientId: '275682877590-lmvmug5241qtefhspreor020gecogtqp.apps.googleusercontent.com',
    iosBundleId: 'com.jasontwong.madManga',
  );
}
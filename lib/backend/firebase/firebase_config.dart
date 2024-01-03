import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDDV7KiJYano4owJ6a3oNGkpJnehFYhOXc",
            authDomain: "finalproject-8e36c.firebaseapp.com",
            projectId: "finalproject-8e36c",
            storageBucket: "finalproject-8e36c.appspot.com",
            messagingSenderId: "1051655729424",
            appId: "1:1051655729424:web:d8e4536be847a1906e3595",
            measurementId: "G-ZEVYB33E0F"));
  } else {
    await Firebase.initializeApp();
  }
}

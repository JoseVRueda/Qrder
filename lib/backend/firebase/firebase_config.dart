import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCw5JdTzU1cj7AYSwRtUXbcOLk_TsOPRNU",
            authDomain: "qrder-wxpm9j.firebaseapp.com",
            projectId: "qrder-wxpm9j",
            storageBucket: "qrder-wxpm9j.appspot.com",
            messagingSenderId: "261320555308",
            appId: "1:261320555308:web:078e084e0161583f5c4a89"));
  } else {
    await Firebase.initializeApp();
  }
}

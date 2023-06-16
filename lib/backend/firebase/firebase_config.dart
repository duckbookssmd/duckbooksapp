import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBIaKmUA2Gnn4VaFF3SHeIEolLVtq3fDfo",
            authDomain: "duckbooksapp-smd.firebaseapp.com",
            projectId: "duckbooksapp-smd",
            storageBucket: "duckbooksapp-smd.appspot.com",
            messagingSenderId: "791612579586",
            appId: "1:791612579586:web:0f85d1af2c82e20b12ac1b",
            measurementId: "G-TJ4H9K57XD"));
  } else {
    await Firebase.initializeApp();
  }
}

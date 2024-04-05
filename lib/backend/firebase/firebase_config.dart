import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDdCPTP057OFgw7_9L2T8BjiGwqaofL5rI",
            authDomain: "traveltalkfb-d2579.firebaseapp.com",
            projectId: "traveltalkfb-d2579",
            storageBucket: "traveltalkfb-d2579.appspot.com",
            messagingSenderId: "259880913975",
            appId: "1:259880913975:web:b8aa0cba877a91c25483b2",
            measurementId: "G-X53XB7VJ26"));
  } else {
    await Firebase.initializeApp();
  }
}

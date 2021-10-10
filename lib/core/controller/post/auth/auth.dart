import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    Get.offNamed("books");
  } else
    Get.offNamed("login");

  return firebaseApp;
}


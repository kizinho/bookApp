import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offNamed("login");
  }
}

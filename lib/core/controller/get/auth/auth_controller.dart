import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;
  RxString username = ''.obs;
  RxString photo = 'https://e7.pngegg.com/pngimages/1008/377/png-clipart-computer-icons-avatar-user-profile-avatar-heroes-black-hair.png'.obs;

  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  checkLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      isAuthenticated.value = true;
      username.value = user.displayName!;
      if(user.photoURL !=null) {
        photo.value = user.photoURL!;
      }
    }
  }
}

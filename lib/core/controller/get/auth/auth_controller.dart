import 'package:booksfinder/service/api/api_utils/api_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;
  RxString username = ''.obs;
  RxString userId = ''.obs;
  RxString email = ''.obs;
  RxString photo = ApiRoutes.avatar.obs;

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
      userId.value = user.uid;
      email.value = user.email!;
      if(user.photoURL !=null) {
        photo.value = user.photoURL!;
      }
    }
  }

}

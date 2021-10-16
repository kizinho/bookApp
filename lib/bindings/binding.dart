import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/core/controller/get/drawer/drawer_controller.dart';
import 'package:bookapp/core/controller/get/onboarding_controller/onboarding_controller.dart';
import 'package:bookapp/core/controller/get/user/user_controller.dart';
import 'package:get/get.dart';

class BindingControllers implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<DrawerAppController>(DrawerAppController(), permanent: true);
    Get.put<BooksController>(BooksController(), permanent: true);
    Get.lazyPut(() => (UserController()));
    Get.lazyPut(() => (OnboardingController()));
  }
}

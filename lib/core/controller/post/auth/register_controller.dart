import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final FocusNode focusPassword = new FocusNode();
  final FocusNode focusEmail = new FocusNode();
  final FocusNode focusUsername = new FocusNode();
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    focusEmail.dispose();
    focusUsername.dispose();
    focusPassword.dispose();
    emailController.dispose();
    passwordController.dispose();
   usernameController.dispose();
    super.onClose();
  }
  registerUser() {
    print(emailController.text);
  }
}

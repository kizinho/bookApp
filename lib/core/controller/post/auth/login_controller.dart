import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode focusPassword = new FocusNode();
  final FocusNode focusEmail = new FocusNode();
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    focusEmail.dispose();
    focusPassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  loginUser() {
    print(emailController.text);
  }
}

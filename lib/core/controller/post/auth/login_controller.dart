import 'package:bookapp/core/controller/post/auth/auth.dart';
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
    initializeFirebase();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  loginUser() {
    print(emailController.text);
  }
}

import 'package:bookapp/core/controller/get/basic/navigator.dart';
import 'package:bookapp/view/widget/snackbar/error.dart';
import 'package:bookapp/view/widget/snackbar/success.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode focusPassword = new FocusNode();
  final FocusNode focusEmail = new FocusNode();
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    //initializeFirebase();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  loginUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      if (isLoading.value == true) {
        return null;
      }
      isLoading.value = true;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      user = userCredential.user;
      snackBarSuccess('Success!', 'Logging in please wait', true);
      startTimer('books');
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBarError('Error!', 'No user with that email.', false);
      } else if (e.code == 'wrong-password') {
        snackBarWarning('Error!', 'Wrong password provided.', false);
      }
      isLoading.value = false;
    }
    return user;
  }
}

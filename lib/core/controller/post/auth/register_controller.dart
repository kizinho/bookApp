import 'package:bookapp/core/controller/get/basic/navigator.dart';
import 'package:bookapp/view/widget/snackbar/error.dart';
import 'package:bookapp/view/widget/snackbar/success.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
    super.onClose();
  }

  registerUser() async {
    User? user;
    try {
      if (isLoading.value == true) {
        return null;
      }
      isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      user = userCredential.user;
      await user!.updateDisplayName(usernameController.text);
      await user.reload();
      user = auth.currentUser;
      snackBarSuccess('Success!', 'Registration success', true);
      startTimer('books');
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarWarning('Error!', 'The password provided is too weak', false);
      } else if (e.code == 'email-already-in-use') {
        snackBarWarning('Error!', 'email already taken', false);
      }
      isLoading.value = false;
    } catch (e) {
      snackBarError('Error!', '$e', false);
      isLoading.value = false;
    }
    return user;
  }
}

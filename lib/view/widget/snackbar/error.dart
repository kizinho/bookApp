import 'package:booksfinder/view/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBarError(title, message, loader) {
  Get.snackbar(title, message,
      icon: loader
          ? Padding(
              padding: EdgeInsets.all(5),
              child: Loader(),
            )
          : Container(),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      duration: Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade700);
}

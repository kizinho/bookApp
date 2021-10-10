import 'package:bookapp/view/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBarSuccess(title, message, loader) {
  Get.snackbar(title, message,
      icon: loader ? Container(margin: EdgeInsets.only(left: 10,right: 10),
          width:30,height: 30,child: Loader()) : Container(),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      duration: Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade700);
}

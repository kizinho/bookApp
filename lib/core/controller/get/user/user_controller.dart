import 'package:bookapp/core/model/user/menu/menu_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final List<DropDownLists> dropDown = <DropDownLists>[
    DropDownLists(
      'Profile',
      Icon(
        Icons.person,
        color: Colors.black.withOpacity(0.6),
        size: 14,
      ),
    ),
    DropDownLists(
      'Change Password',
      Icon(
        Icons.password,
        color: Colors.black.withOpacity(0.6),
        size: 14,
      ),
    ),
    DropDownLists(
      'Change Avatar',
      Icon(
        Icons.supervised_user_circle,
        color: Colors.black.withOpacity(0.6),
        size: 14,
      ),
    ),
    DropDownLists(
      'Logout',
      Icon(
        Icons.logout,
        color: Colors.black.withOpacity(0.6),
        size: 14,
      ),
    ),
  ];
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offNamed("login");
  }
  navigate(value) {
    if (value == 'Profile') {
    }
    if (value == 'Change Password') {
    }
    if (value == 'Change Avatar') {
    }
    if (value == 'Logout') {
      signOut();
    }
  }
}

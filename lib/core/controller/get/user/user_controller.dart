import 'package:booksfinder/core/controller/get/books/books_controller.dart';
import 'package:booksfinder/core/controller/get/drawer/drawer_controller.dart';
import 'package:booksfinder/core/model/user/menu/menu_list.dart';
import 'package:booksfinder/view/widget/snackbar/warning.dart';
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
    Get.find<DrawerAppController>().automaticallyImplyLeading.value = false;
    Get.find<BooksController>().itemDataFavorite!.clear();
    Get.find<BooksController>().selectedTab.value = ['Latest'];
    Get.find<BooksController>().query.value = 0;
    Get.find<BooksController>().isFavourite.value = false;
    Get.offNamed("login");
  }

  navigate(value) {
    if (value == 'Profile') snackBarWarning('warning', 'todo do later', false);
    if (value == 'Change Password')
      snackBarWarning('warning', 'todo do later', false);
    if (value == 'Change Avatar')
      snackBarWarning('warning', 'todo do later', false);
    if (value == 'Logout') signOut();
  }
}

import 'package:booksfinder/view/widget/drawer/drawer_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerAppController extends GetxController {
  Rx<GlobalKey<BookDrawerState>> drawerKey = GlobalKey<BookDrawerState>().obs;
  Rx<GlobalKey<BookDrawerState>> drawerKeyDetails = GlobalKey<BookDrawerState>().obs;
  RxBool removePageController = false.obs;
  RxBool automaticallyImplyLeading = false.obs;
}

import 'dart:io';

import 'package:booksfinder/service/api/api_utils/api_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;
  RxString username = ''.obs;
  RxString userId = ''.obs;
  RxString email = ''.obs;
  RxString photo = ApiRoutes.avatar.obs;
  Rx<PackageInfo> packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  ).obs;
  var url;
  @override
  void onInit() {
    checkLogin();
    initPackageInfo();
    super.onInit();
  }

  checkLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      isAuthenticated.value = true;
      username.value = user.displayName!;
      userId.value = user.uid;
      email.value = user.email!;
      if (user.photoURL != null) {
        photo.value = user.photoURL!;
      }
    }
  }

  Future<void> initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo.value = info;
  }

  shareAppUrl() {
    if (Platform.isIOS || Platform.isMacOS) {
      // url = "https://apps.apple.com/us/app/naijacrawl/id1587370967";
      // shareLink(url, 'Media Fisher App');
    } else {
      url =
          "https://play.google.com/store/apps/details?id=${packageInfo.value.packageName}";
      shareLink(url, 'Media Fisher App');
    }
  }

  shareLink(String url, title) {
    Share.share(url,
        subject: title, sharePositionOrigin: Rect.fromLTWH(0, 0, 1, 1));
  }
}

import 'package:bookapp/service/theme/theme_service.dart';
import 'package:bookapp/view/theme/theme_dark.dart';
import 'package:bookapp/view/theme/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../locator.dart';

class ThemeController extends GetxController {
  static RxBool _isDark = false.obs;

  ThemeData get appTheme => _isDark.value ? appThemeDark : appThemeLight;

  bool get isDarkMode => _isDark.value;

  getValuesFromThemeService() async {
    final themeService = locator<ThemeService>();
    bool isDark = await themeService.initializeThemeService();

    _isDark.value = isDark;
  }

  void toggleAppTheme() async {
    var box = await Hive.openBox('bookApp');
    box.put('isDark', _isDark);
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'bindings/binding.dart';
import 'core/controller/get/theme/theme_controller.dart';
import 'core/routes/route_names.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase messaging
  await Firebase.initializeApp();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  setupLocator();
  //Initialize theme
  runApp(MaterialAPP());
}

class MaterialAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController()).getValuesFromThemeService();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingControllers(),
      title: 'BOOKS_APP',
      unknownRoute: RouteNames.unknown.first,
      initialRoute: RouteNames.routes.first.name,
      getPages: RouteNames.routes,
      theme: Get.put(ThemeController()).appTheme,
    );
  }
}

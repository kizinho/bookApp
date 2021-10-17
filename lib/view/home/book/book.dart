import 'package:booksfinder/core/controller/get/drawer/drawer_controller.dart';
import 'package:booksfinder/view/home/book/books_page.dart';
import 'package:booksfinder/view/widget/drawer/drawer_animation.dart';
import 'package:booksfinder/view/widget/drawer/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final drawer = Get.find<DrawerAppController>();

class Book extends StatelessWidget {
  const Book({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => BookDrawer(
              bodySize: 140,
              radius: 40,
              key: drawer.drawerKey.value,
              hasClone: drawer.removePageController.value,
              bodyBackgroundPeekSize: 40,
              backgroundColor: Theme.of(context).highlightColor.withOpacity(0.9),
              // pass drawer widget
              drawer: DrawerItem(),
              child: BookPage(),
            )));
  }
}

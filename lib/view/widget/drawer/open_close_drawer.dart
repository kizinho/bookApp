import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:bookapp/core/controller/get/drawer/drawer_controller.dart';
import 'package:bookapp/core/controller/get/user/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final drawer = Get.find<DrawerAppController>();
final auth = Get.find<AuthController>();
final user = Get.find<UserController>();
headerNav(title, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20),
    child: Obx(() => AppBar(
          automaticallyImplyLeading: drawer.automaticallyImplyLeading.value,
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: drawer.removePageController.value == false
                      ? Icon(CupertinoIcons.text_alignleft)
                      : Icon(CupertinoIcons.clear_circled),
                  onPressed: () {
                    if (drawer.drawerKey.value.currentState!.isOpened()) {
                      drawer.drawerKey.value.currentState!.closeDrawer();
                    } else {
                      drawer.drawerKey.value.currentState!.openDrawer();
                    }
                  },
                ),
              );
            },
          ),
          title: Center(
              child:
                  Text("$title", style: Theme.of(context).textTheme.headline3)),
          actions: [
            PopupMenuButton(
              child: Container(
                margin: EdgeInsets.only(top: 6),
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('${auth.photo.value}'),
                  radius: 50,
                ),
              ),
              onSelected: (value) {
                user.navigate(value);
              },
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.0))),
              itemBuilder: (context) {
                return user.dropDown
                    .map((value) => PopupMenuItem(
                        value: value.title,
                        child: Row(
                          children: [
                            value.icon,
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                value.title,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        )))
                    .toList();
              },
            ),
          ],
        )),
  );
}

import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:bookapp/core/controller/get/theme/theme_controller.dart';
import 'package:bookapp/core/controller/get/user/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
final auth = Get.find<AuthController>();
final model= Get.find<ThemeController>();
class DrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 14,right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6),
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('${auth.photo.value}'),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    children: [
                      Text('${auth.username}',style: GoogleFonts.ptSans(
                          fontSize: 20,
                          color: Theme.of(context).canvasColor,fontWeight: FontWeight.bold)),
                      Text('${auth.email}',style: GoogleFonts.ptSans(
                          fontSize: 10,
                          color: Theme.of(context).canvasColor)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 35),
            Padding (
              padding: const EdgeInsets.only(
                  left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.support_agent,
                        color:
                        Theme.of(context).canvasColor,
                        size: 25,
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 3),
                        child: Text('Support',
                            style: Theme.of(context)
                                .textTheme
                                .headline5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            Divider(color: Theme.of(context).canvasColor,thickness: 0.3,),
            Padding (
              padding: const EdgeInsets.only(
                  left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.share,
                        color:
                        Theme.of(context).canvasColor,
                        size: 25,
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 3),
                        child: Text('Share',
                            style: Theme.of(context)
                                .textTheme
                                .headline5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            Divider(color: Theme.of(context).canvasColor,thickness: 0.3,),
            Padding (
              padding: const EdgeInsets.only(
                  left: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.support_agent,
                        color:
                        Theme.of(context).canvasColor,
                        size: 25,
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 3),
                        child: Text('Support',
                            style: Theme.of(context)
                                .textTheme
                                .headline5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            Divider(color: Theme.of(context).canvasColor,thickness: 0.3,),
            Padding (
              padding: const EdgeInsets.only(
                  left: 8.0),
              child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(bottom: 14.0),
                          child: Text(
                            'Dark Mode',
                            style: GoogleFonts.dmSans(
                                fontSize: 18,
                                color: Theme.of(context).canvasColor),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Obx(() =>Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Switch(
                            inactiveThumbColor:
                            Theme.of(context).canvasColor,
                            inactiveTrackColor:
                            Theme.of(context).indicatorColor,
                            focusColor: Theme.of(context).canvasColor,
                            value: model.isDarkMode,
                            activeColor: model.isDarkMode
                                ? Theme.of(context).focusColor
                                : Theme.of(context).primaryColor,
                            activeTrackColor:
                            Theme.of(context).canvasColor,
                            onChanged: (bool value) {
                              model.toggleAppTheme(value);

                            },
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
            ),
            SizedBox(height: 12,),
            Divider(color: Theme.of(context).canvasColor,thickness: 0.3,),
           GestureDetector(
              child: Padding (
                padding: const EdgeInsets.only(
                    left: 8.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          CupertinoIcons.power,
                          color:
                          Theme.of(context).canvasColor,
                          size: 25,
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 3),
                          child: Text('Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             onTap: () =>Get.find<UserController>().signOut()

            ),
          ],
        ),
      ),

    );
  }
}

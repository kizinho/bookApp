import 'package:bookapp/core/controller/get/books/books_details_controller.dart';
import 'package:bookapp/core/controller/get/drawer/drawer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final bookDetails = Get.find<BooksDetailsController>();
final drawer = Get.find<DrawerAppController>();

class OpenAndCloseDetailsDrawer extends StatelessWidget {
  final title;
  final image;

  const OpenAndCloseDetailsDrawer({Key? key, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverAppBar(
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: bookDetails.changeSliverBar.value
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                      child: Text(
                        "$title",
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "$image",
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.4),
                        Colors.teal.shade700.withOpacity(0.4),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(2.0, 0.0),
                      stops: [0.1, 0.6, 0.2, 1],
                    ),
                  ),
                ),
              ) //Images.network

              ), //FlexibleSpaceBar

          expandedHeight: 230,
          backgroundColor: Theme.of(context).backgroundColor,

          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: drawer.removePageController.value == false
                  ? Icon(
                      Icons.arrow_back_ios,
                      color: bookDetails.changeSliverBar.value
                          ? Theme.of(context).cardColor
                          : Theme.of(context).highlightColor.withOpacity(0.5),
                    )
                  : GestureDetector(
                      child: Icon(
                        CupertinoIcons.clear_circled,
                        color: bookDetails.changeSliverBar.value
                            ? Theme.of(context).cardColor
                            : Theme.of(context).highlightColor.withOpacity(0.8),
                      ),
                      onTap: () {
                        if (drawer.drawerKeyDetails.value.currentState!
                            .isOpened())
                          drawer.drawerKeyDetails.value.currentState!
                              .closeDrawer();
                        else
                          drawer.drawerKeyDetails.value.currentState!
                              .openDrawer();
                      },
                    ),
              tooltip: 'Back',
              onPressed: () {
                Get.back();
              },
            ),
          ), //IconButton

          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: drawer.removePageController.value == false
                    ? Icon(
                        CupertinoIcons.text_alignright,
                        color: bookDetails.changeSliverBar.value
                            ? Theme.of(context).cardColor
                            : Theme.of(context).highlightColor.withOpacity(0.8),
                      )
                    : Icon(
                        CupertinoIcons.clear_circled,
                        color: bookDetails.changeSliverBar.value
                            ? Theme.of(context).cardColor
                            : Theme.of(context).highlightColor.withOpacity(0.8),
                      ),
                tooltip: 'Menu',
                onPressed: () {
                  if (drawer.drawerKeyDetails.value.currentState!.isOpened())
                    drawer.drawerKeyDetails.value.currentState!.closeDrawer();
                  else
                    drawer.drawerKeyDetails.value.currentState!.openDrawer();
                },
              ),
            ), //IconButton
          ], //<Widget>[]
        ));
  }
}

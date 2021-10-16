import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/view/home/book/tabs/skeleton_data_tab.dart';
import 'package:bookapp/view/home/book/tabs/tab_data_books.dart';
import 'package:bookapp/view/home/book/tabs/tab_data_books_favourite.dart';
import 'package:bookapp/view/widget/loader/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

final books = Get.find<BooksController>();

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Row(
            children: [
              for (var i = 0; i < books.name.length; i++)
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: books.selectedTab.contains(books.name[i])
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor.withOpacity(0.08),
                      boxShadow: [
                        if (books.selectedTab.contains(books.name[i]))
                          const BoxShadow(
                            color: Colors.tealAccent,
                            blurRadius: 10,
                          ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                books.selectedTab.contains(books.name[i])
                                    ? CupertinoIcons.book
                                    : Icons.book,
                                size: 14,
                                color: books.selectedTab.contains(books.name[i])
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.2),
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 10),
                                child: Text(
                                  books.name[i],
                                  style: books.selectedTab
                                          .contains(books.name[i])
                                      ? Theme.of(context).textTheme.headline1
                                      : Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    books.query.value = i;
                    books.handleButton(books.name[i]);
                    books.startIndex.value = 0;
                    books.getBookTab();
                  },
                ),
            ],
          ),
          TabDataList(),
        ]));
  }
}

class TabDataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            SizedBox(
              height: 20,
            ),
            if (books.isFavourite.value == false)
              if (books.itemData!.isEmpty)
                ...books.tab.map((e) => SkeletonTabData()).toList()
              else
                ...books.itemData!
                    .map((e) => TabDataBooks(
                          e: e,
                        ))
                    .toList()
            else if (books.itemDataFavorite!.isEmpty)
              ...books.tab.map((e) => SkeletonTabData()).toList()
            else
              ...books.itemDataFavorite!
                  .map((e) => TabDataBooksFavourite(
                        e: e,
                      ))
                  .toList(),
            SizedBox(
              height: 20,
            ),
            if (books.isFavourite.value == false) Loader(),
            if (books.itemDataFavorite!.length >= 40) Loader(),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

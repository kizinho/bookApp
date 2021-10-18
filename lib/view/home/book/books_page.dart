import 'package:booksfinder/core/controller/get/auth/auth_controller.dart';
import 'package:booksfinder/core/controller/get/books/books_controller.dart';
import 'package:booksfinder/view/home/book/search/bar.dart';
import 'package:booksfinder/view/widget/drawer/open_close_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'datas/relevance/relevance.dart';
import 'tabs/tabs.dart';

final auth = Get.find<AuthController>();
final books = Get.find<BooksController>();

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: headerNav('Books Finder', context),
      ),
      body: RefreshIndicator(
        onRefresh: () => books.bookRefresh(0),
        backgroundColor: Theme.of(context).primaryColor,
        color: Theme.of(context).focusColor,
        displacement: 200,
        strokeWidth: 5,
        child: Obx(()=>NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              if (books.isFavourite.value == false) books.getBookTabLoadMore();
            }
            return false;
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hi ${auth.username.value}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Search your desired books here..',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 38, child: SearchBar()),
                    SizedBox(
                      height: 20,
                    ),
                    Relevance(),
                    SizedBox(
                      height: 5,
                    ),
                    Tabs()
                  ],
                ),
              )),
        )),
      ),
    );
  }
}

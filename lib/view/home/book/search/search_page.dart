import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/core/controller/get/books/search_controller.dart';
import 'package:bookapp/core/controller/get/drawer/drawer_controller.dart';
import 'package:bookapp/view/home/book/search/bar.dart';
import 'package:bookapp/view/widget/drawer/open_close_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final search = Get.put(SearchController());
final books = Get.find<BooksController>();
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<DrawerAppController>().automaticallyImplyLeading.value = true;
    books.searchTitle.value = books.searchController.text;
    search .getSearchResult();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: headerNav(books.searchTitle.value, context),
      ),
      body: RefreshIndicator(
        onRefresh: () => books.bookRefresh(0),
        backgroundColor: Theme.of(context).primaryColor,
        color: Theme.of(context).focusColor,
        displacement: 200,
        strokeWidth: 5,
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {

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
                      height: 40,
                    ),

                    SizedBox(height: 38, child: SearchBar()),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
        )),
      ),
    );
  }
}

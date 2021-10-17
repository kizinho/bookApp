import 'package:booksfinder/core/controller/get/books/books_controller.dart';
import 'package:booksfinder/core/controller/get/books/search_controller.dart';
import 'package:booksfinder/view/home/book/search/bar.dart';
import 'package:booksfinder/view/home/book/search/search_data_result.dart';
import 'package:booksfinder/view/widget/drawer/open_close_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final search = Get.find<SearchController>();
final books = Get.find<BooksController>();

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Obx(() =>headerNav(books.searchTitle.value, context)),
      ),
      body: RefreshIndicator(
        onRefresh: () => search.getSearchResult(
            books.searchValue.value.toLowerCase(),
            books.searchMaxResult.value,
            books.searchTitle.value),
        backgroundColor: Theme.of(context).primaryColor,
        color: Theme.of(context).focusColor,
        displacement: 200,
        strokeWidth: 5,
        child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                search.getLoadMore(books.searchValue.value.toLowerCase(),
                    books.searchMaxResult.value, books.searchTitle.value);
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: SingleChildScrollView(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(height: 38, child: SearchBar()),
                        SizedBox(
                          height: 30,
                        ),
                        SearchDataResult(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
            )),
      ),
    );
  }
}

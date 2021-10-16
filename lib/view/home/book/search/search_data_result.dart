
import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/core/controller/get/books/search_controller.dart';
import 'package:bookapp/view/home/book/tabs/skeleton_data_tab.dart';
import 'package:bookapp/view/home/book/tabs/tab_data_books.dart';
import 'package:bookapp/view/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final search = Get.find<SearchController>();
final books = Get.find<BooksController>();
class SearchDataResult extends StatelessWidget {
  const SearchDataResult({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() =>Column(
      children: [
        if (search.itemData!.isNotEmpty)
          Center(
            child: Text(
              'Results for ${books.searchTitle.value}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        SizedBox(
          height: 30,
        ),
        if (search.itemData!.isEmpty)
          ...books.tab.map((e) => SkeletonTabData()).toList()
        else
          ...search.itemData!
              .map((e) => TabDataBooks(
            e: e,
          ))
              .toList(),
        SizedBox(
          height: 5,
        ),
        if (search.itemData!.length >=
            books.searchMaxResult.value)
          Loader(),
      ],
    ));
  }
}

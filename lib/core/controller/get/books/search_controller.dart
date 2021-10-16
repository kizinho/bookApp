import 'package:bookapp/core/controller/get/drawer/drawer_controller.dart';
import 'package:bookapp/core/model/user/books/booksDataModel/books_data.dart';
import 'package:bookapp/service/api/api_utils/network_exceptions.dart';
import 'package:bookapp/service/api/books_api/books_api.dart';
import 'package:bookapp/view/widget/snackbar/error.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:get/get.dart';

import '../../../../locator.dart';
import 'books_controller.dart';

final books = Get.find<BooksController>();

class SearchController extends GetxController {
//API
  var bookApi = locator<BooksApi>();
  RxInt startIndex = 0.obs;
  RxList<Item>? itemData = <Item>[].obs;
  RxBool bookRefreshing = false.obs;
  @override
  void onInit() {
    Get.find<DrawerAppController>().automaticallyImplyLeading.value = true;
    getSearchResult(books.searchValue.value.toLowerCase(),
        books.searchMaxResult.value, books.searchTitle.value);
    super.onInit();
  }

  getSearchResult(orderBy, maxResults, value) async {
    try {
      startIndex.value = 0;
      BooksData result = await bookApi.searchBook(
          startIndex.value, orderBy, maxResults, value);
      itemData!.value = result.items!;
      startIndex.value = startIndex.value + 1;
      return result;
    } on NetworkException {
      snackBarWarning(
          'No Internet!', 'Please check your internet Connection', false);
    } catch (e) {
      snackBarError('An Error Occured!', '$e', false);
    }
  }

  getLoadMore(orderBy, maxResults, value) async {
    if (bookRefreshing.value) {
      print('more data is still fetching');
      return null;
    }
    if (startIndex.value == 0) {
      print('still on the first page');
      return null;
    }
    try {
      bookRefreshing.value = true;
      BooksData searchResult = await bookApi.searchBook(
          startIndex.value, orderBy, maxResults, value);
      itemData!.addAll(searchResult.items!);
      bookRefreshing.value = false;
      startIndex.value = startIndex.value + 1;
      return searchResult;
    } on NetworkException {
      bookRefreshing.value = false;
      snackBarWarning(
          'No Internet!', 'Please check your internet Connection', false);
    } catch (e) {
      bookRefreshing.value = false;
      snackBarError('An Error Occured!', '$e', false);
    }
  }
}
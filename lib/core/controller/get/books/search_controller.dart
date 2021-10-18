import 'package:booksfinder/core/model/user/books/booksDataModel/books_data.dart';
import 'package:booksfinder/service/api/api_utils/network_exceptions.dart';
import 'package:booksfinder/service/api/books_api/books_api.dart';
import 'package:booksfinder/view/widget/snackbar/error.dart';
import 'package:booksfinder/view/widget/snackbar/warning.dart';
import 'package:get/get.dart';

import '../../../../locator.dart';
import 'books_controller.dart';

final books = Get.put(BooksController());

class SearchController extends GetxController {
//API
  var bookApi = locator<BooksApi>();
  RxInt startIndex = 0.obs;
  RxList<Item>? itemData = <Item>[].obs;
  RxBool bookRefreshing = false.obs;
  RxBool checkResult = false.obs;
  @override
  void onInit() {
    getSearchResult(books.searchValue.value.toLowerCase(),
        books.searchMaxResult.value, books.searchTitle.value);
    super.onInit();
  }

  getSearchResult(orderBy, maxResults, value) async {
    try {
      startIndex.value = 0;
      itemData!.value = [];
      BooksData result = await bookApi.searchBook(
          startIndex.value, orderBy, maxResults, value);
      if (result.items == null) {
        checkResult.value = true;
        return null;
      } else {
        checkResult.value = false;
      }
      itemData!.value = result.items!;
      startIndex.value = startIndex.value + 1;
      Get.find<BooksController>().selectedFilter.clear();
      Get.find<BooksController>().searchController.clear();
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
     // print('more data is still fetching');
      return null;
    }
    if (startIndex.value == 0) {
     // print('still on the first page');
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

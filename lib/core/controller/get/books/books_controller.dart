import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:bookapp/core/model/user/books/booksDataModel/books_data.dart';
import 'package:bookapp/core/model/user/books/booksDataModel/books_favourite.dart';
import 'package:bookapp/service/api/api_utils/network_exceptions.dart';
import 'package:bookapp/service/api/books_api/books_api.dart';
import 'package:bookapp/view/widget/snackbar/error.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../locator.dart';

class BooksController extends GetxController {
  //API
  var bookApi = locator<BooksApi>();
  RxBool status = false.obs;
  RxList name = [].obs;
  RxList filterName = [].obs;
  RxList<Item>? itemData = <Item>[].obs;
  RxList<FavouriteModel>? itemDataFavorite = <FavouriteModel>[].obs;
  RxList selectedTab = [].obs;
  RxList selectedFilter = [].obs;
  RxInt query = 0.obs;
  final booksData = Rxn<BooksData>();
  RxInt startIndex = 0.obs;
  final maxResults = 40;
  final list = new List<int>.generate(15, (i) => i + 1);
  final tab = new List<int>.generate(25, (i) => i + 1);
  RxBool bookRefreshing = false.obs;
  RxBool isFavourite = false.obs;
  final searchController = TextEditingController();
  RxString searchTitle = ''.obs;
  RxString searchValue = 'Newest'.obs;
  RxInt searchMaxResult = 10.obs;
  RxBool checkResult = false.obs;
  @override
  void onInit() {
    myList();
    myFilter();
    selectedTab.value = ['Latest'];
    getBookTab();
    getBookRelevance();
    super.onInit();
  }

  @override
  onClose() {
    itemDataFavorite!.clear();
    selectedFilter.clear();
    searchController.clear();
    super.onClose();
  }

  Future<void> bookRefresh(value) {
    startIndex.value = value;
    getBookTab();
    getBookRelevance();
    return Future(itemData!);
  }

  final listsFinal = [
    'Latest',
    'My Favorites',
  ];
  myList() {
    name.value = listsFinal;
  }

  final listsFilter = [
    'Newest',
    'Relevance',
    '10 MaxResult',
    '20 MaxResult',
    '30 MaxResult',
    '40 MaxResult',
  ];
  myFilter() {
    filterName.value = listsFilter;
  }

  handleButton(i) {
    if (i == 'My Favorites')
      selectedTab.remove('Latest');
    else if (i == 'Latest') selectedTab.remove('My Favorites');
    var iSelected = selectedTab.contains(i);
    if (!iSelected) selectedTab.add(i);
  }

  handleFilter(i) {
    if (i == 'Newest') {
      selectedFilter.remove('Relevance');
      searchValue.value = 'Newest';
    } else if (i == 'Relevance') {
      selectedFilter.remove('Newest');
      searchValue.value = 'Relevance';
    } else if (i == '10 MaxResult') {
      selectedFilter.remove('20 MaxResult');
      selectedFilter.remove('30 MaxResult');
      selectedFilter.remove('40 MaxResult');
      searchMaxResult.value = 10;
    } else if (i == '20 MaxResult') {
      selectedFilter.remove('10 MaxResult');
      selectedFilter.remove('30 MaxResult');
      selectedFilter.remove('40 MaxResult');
      searchMaxResult.value = 20;
    } else if (i == '30 MaxResult') {
      selectedFilter.remove('10 MaxResult');
      selectedFilter.remove('20 MaxResult');
      selectedFilter.remove('40 MaxResult');
      searchMaxResult.value = 30;
    } else if (i == '40 MaxResult') {
      selectedFilter.remove('10 MaxResult');
      selectedFilter.remove('20 MaxResult');
      selectedFilter.remove('30 MaxResult');
      searchMaxResult.value = 40;
    }

    var iSelected = selectedFilter.contains(i);
    if (!iSelected) selectedFilter.add(i);
  }

  loadBookTabs() {
    print('this is what we use find tab at ${query.value}');
  }

  getBookRelevance() async {
    try {
      BooksData result = await bookApi.getRelevanceBook();
      booksData.value = result;
      return result;
    } on NetworkException {
      snackBarWarning(
          'No Internet!', 'Please check your internet Connection', false);
    } catch (e) {
      snackBarError('An Error Occured!', '$e', false);
    }
  }

  getBookTab() async {
    try {
      if (query.value == 0) {
        isFavourite.value = false;
        BooksData latestResult =
            await bookApi.getLatestBook(startIndex.value, maxResults);
        itemData!.value = latestResult.items!;
        startIndex.value = startIndex.value + 1;
        return latestResult;
      } else {
        isFavourite.value = true;
        itemDataFavorite!.value = [];
        FirebaseFirestore.instance
            .collection('favorites')
            .orderBy('createdAt', descending: true)
            .where('userId', isEqualTo: Get.find<AuthController>().userId.value)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result) {
            itemDataFavorite!
                .add(FavouriteModel.fromDocumentSnapshot(doc: result));
          });
          if (itemDataFavorite!.isEmpty) {
            checkResult.value = true;
            return null;
          }else{
            checkResult.value = false;
          }
          return itemDataFavorite;
        });
      }
    } on NetworkException {
      snackBarWarning(
          'No Internet!', 'Please check your internet Connection', false);
    } catch (e) {
      snackBarError('An Error Occured!', '$e', false);
    }
  }

  getBookTabLoadMore() async {
    // print('.. starting from ${startIndex.value} and ends to $maxResults ');
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
      if (query.value == 0) {
        isFavourite.value = false;
        BooksData latestResult =
            await bookApi.getLatestBook(startIndex.value, maxResults);
        itemData!.addAll(latestResult.items!);
        bookRefreshing.value = false;
        startIndex.value = startIndex.value + 1;
        return latestResult;
      } else {
        print('no pagination for my favourite');
        isFavourite.value = true;
        bookRefreshing.value = true;
        return null;
      }
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

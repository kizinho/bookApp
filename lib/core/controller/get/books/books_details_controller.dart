import 'package:booksfinder/core/controller/get/auth/auth_controller.dart';
import 'package:booksfinder/core/model/user/books/booksDataModel/books_data.dart';
import 'package:booksfinder/service/api/books_api/books_api.dart';
import 'package:booksfinder/view/widget/snackbar/error.dart';
import 'package:booksfinder/view/widget/snackbar/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'books_controller.dart';

class BooksDetailsController extends GetxController {
  //API
  var bookApi = locator<BooksApi>();
  ScrollController controller = ScrollController();
  RxBool changeSliverBar = false.obs;
  RxBool favorite = false.obs;
  RxString title = ''.obs;
  final booksData = Rxn<BooksData>();
  @override
  void onInit() {
    controller.addListener(() {
      if (controller.offset > 180 && !controller.position.outOfRange) {
        changeSliverBar.value = false;
      }
      if (controller.offset <= 180 && !controller.position.outOfRange) {
        changeSliverBar.value = true;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  onSubmitFavorite(
    bookId,
    userId,
    title,
    image,
    rating,
    author,
    category,
    createdAt,
    description,
    buy,
    available,
    amount,
    url,
    preview,
  ) {
    //comment out to use functions , function not using because of the billing involve
    // HttpsCallable callable =
    //     FirebaseFunctions.instance.httpsCallable('addFavorite');
    // callable({
    //   bookId: bookId,
    //   userId: userId,
    //   title: title,
    //   image: image,
    //   rating: rating,
    //   author: author,
    //   category: category,
    //   'publishedDate': createdAt,
    //   description: description,
    //   buy: buy,
    //   available: available,
    //   amount: amount,
    //   url: url,
    //   preview: preview,
    //   createdAt: DateTime.now()
    // }).then((value) {
    //   favorite.value = true;
    //   Get.find<BooksController>().getBookTab();
    //   snackBarSuccess('success', 'favorite added', false);
    // }).catchError((error) {
    //   snackBarError('error', '$error', false);
    // });
    FirebaseFirestore.instance.collection('favorites').add({
      'bookId': bookId,
      'userId': userId,
      'title': title,
      'image': image,
      'rating': rating,
      'author': author,
      'category': category,
      'publishedDate': createdAt,
      'description': description,
      'buy': buy,
      'available': available,
      'amount': amount,
      'url': url,
      'preview': preview,
      'createdAt': DateTime.now()
    }).then((value) {
      favorite.value = true;
      Get.find<BooksController>().getBookTab();
      snackBarSuccess('success', 'favorite added', false);
    }).catchError((error) {
      snackBarError('error', '$error', false);
    });
  }

  onDeleteFavorite(bookId, userId) {
    FirebaseFirestore.instance
        .collection('favorites')
        .where('bookId', isEqualTo: bookId)
        .where('userId', isEqualTo: userId)
        .get()
        .then((snapshot) {
      snapshot.docs.first.reference.delete();
      favorite.value = false;
      Get.find<BooksController>().getBookTab();
      snackBarSuccess('success', 'favorite removed', false);
    }).catchError((error) {
      snackBarError('error', '$error', false);
    });
  }

  checkFavorite(bookId) {
    FirebaseFirestore.instance
        .collection('favorites')
        .where('bookId', isEqualTo: bookId)
        .where('userId', isEqualTo: Get.find<AuthController>().userId)
        .get()
        .then((snapshot) {
      snapshot.docs.first;
      favorite.value = true;
    }).catchError((error) {
      favorite.value = false;
    });
  }
}

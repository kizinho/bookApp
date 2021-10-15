import 'package:bookapp/core/model/user/books/booksDataModel/books_data.dart';
import 'package:bookapp/core/model/user/books/booksDataModel/books_favourite.dart';
import 'package:bookapp/service/api/api_utils/api_routes.dart';
import 'package:bookapp/view/home/book/details/books_details.dart';
import 'package:get/get.dart';

dataNavigate(Item e) {
  Get.to(() => BooksDetails(
      bookId: e.id,
      title: e.volumeInfo!.title,
      image: e.volumeInfo!.imageLinks == null
          ? ApiRoutes.bookNoImage
          : '${e.volumeInfo!.imageLinks!.thumbnail}',
      rating:
          e.volumeInfo!.averageRating == null ? 0 : e.volumeInfo!.averageRating,
      author: e.volumeInfo!.authors,
      category: e.volumeInfo!.categories,
      favourite: false,
      createdAt: e.volumeInfo!.publishedDate,
      description: e.volumeInfo!.description,
      buy: e.saleInfo!.buyLink,
      available: e.saleInfo!.saleability,
      amount: e.saleInfo!.listPrice,
      url: e.accessInfo!.webReaderLink,
      preview: e.volumeInfo!.previewLink));
}

dataNavigateFavourite(FavouriteModel e) {
  Get.to(() => BooksDetails(
      bookId: e.bookId,
      title: e.title,
      image: e.image == null ? ApiRoutes.bookNoImage : '${e.image}',
      rating: e.rating == null ? 0 : e.rating,
      author: e.author,
      category: e.category,
      favourite: true,
      createdAt: e.publishedDate,
      description: e.description,
      buy: e.buy,
      available: e.available,
      amount: e.amount,
      url: e.url,
      preview: e.preview));
}

import 'dart:convert';
import 'package:booksfinder/core/model/user/books/booksDataModel/books_data.dart';
import 'package:booksfinder/service/api/api_utils/api_helper.dart';
import 'package:booksfinder/service/api/api_utils/api_routes.dart';
import 'package:booksfinder/service/header.dart';

import '../../../../locator.dart';
import 'books_api.dart';

class BooksApiImpl implements BooksApi {
  var server = locator<API>();
  getRelevanceBook() async {
    var responsebody = await server.get(ApiRoutes.relevance, noAuthHeader());
    var decoded = jsonDecode(responsebody);
    BooksData response = BooksData.fromJson(decoded);
    return response;
  }

  getLatestBook(startIndex, maxResults) async {
    var responsebody = await server.get(
        '${ApiRoutes.books}&startIndex=$startIndex&maxResults=$maxResults&key=${ApiRoutes.apiKey}',
        noAuthHeader());
    var decoded = jsonDecode(responsebody);
    BooksData response = BooksData.fromJson(decoded);
    return response;
  }

  searchBook(startIndex, orderBy, maxResults, value) async {
    var responsebody = await server.get(
        '${ApiRoutes.search}?q=$value&orderBy=$orderBy&startIndex=$startIndex&maxResults=$maxResults&key=${ApiRoutes.apiKey}',
        noAuthHeader());
    var decoded = jsonDecode(responsebody);
    BooksData response = BooksData.fromJson(decoded);
    return response;
  }
}

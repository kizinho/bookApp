import 'package:booksfinder/core/controller/get/books/books_controller.dart';
import 'package:booksfinder/core/model/user/books/booksDataModel/books_data.dart';
import 'package:booksfinder/core/model/user/books/booksDataModel/books_favourite.dart';
import 'package:booksfinder/service/api/api_utils/api_routes.dart';
import 'package:booksfinder/view/widget/book/data_navigation.dart';
import 'package:booksfinder/view/widget/book/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final books = Get.find<BooksController>();

class TabDataBooksFavourite extends StatelessWidget {
  final FavouriteModel e;

  const TabDataBooksFavourite({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 90,
          margin: EdgeInsets.only(bottom: 5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Theme.of(context).cardColor,
            elevation: 0.4,
            shadowColor: Theme.of(context).primaryColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 4.0, left: 68.0, right: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${e.title}',
                          style: GoogleFonts.ptSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).highlightColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${e.description}",
                        style: GoogleFonts.ptSans(
                            fontSize: 12, color: Theme.of(context).disabledColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                                child: Text(
                                  'Rating - ${e.rating == null ? 0 : e.rating}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: e.rating == null || e.rating == 0
                                    ? Icon(
                                  Icons.star_border,
                                  size: 14,
                                  color: Colors.yellow.shade900,
                                )
                                    : Icon(
                                  Icons.star_rate,
                                  size: 14,
                                  color: Colors.yellow.shade900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 2,
                  child: bookImage(e.image == null
                      ? ApiRoutes.bookNoImage
                      : '${e.image}'),
                ),
              ],
            ),
          ),
        ),
        onTap: () => dataNavigateFavourite(e)
    );
  }
}

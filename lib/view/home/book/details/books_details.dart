import 'package:bookapp/core/controller/get/auth/auth_controller.dart';
import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/core/controller/get/books/books_details_controller.dart';
import 'package:bookapp/core/controller/get/drawer/drawer_controller.dart';
import 'package:bookapp/view/utils/remove_bracket_from_authors.dart';
import 'package:bookapp/view/utils/share/share.dart';
import 'package:bookapp/view/utils/switch_rating.dart';
import 'package:bookapp/view/utils/time_convert.dart';
import 'package:bookapp/view/widget/drawer/detailsDrawer/open_close_drawer.dart';
import 'package:bookapp/view/widget/drawer/drawer_animation.dart';
import 'package:bookapp/view/widget/drawer/drawer_items.dart';
import 'package:bookapp/view/widget/snackbar/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final bookDetails = Get.put(BooksDetailsController());
final drawer = Get.find<DrawerAppController>();

class BooksDetails extends StatelessWidget {
  final title;
  final image;
  final rating;
  final author;
  final category;
  final createdAt;
  final description;
  final buy;
  final available;
  final favourite;
  final amount;
  final url;
  final preview;
  final bookId;
  const BooksDetails(
      {Key? key,
      this.title,
      this.image,
      this.rating,
      this.author,
      this.category,
      this.createdAt,
      this.description,
      this.buy,
      this.available,
      this.favourite,
      this.amount,
      this.url,
      this.preview,
      this.bookId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (favourite == false)
      bookDetails.checkFavorite(bookId);
    else
      bookDetails.favorite.value = true;
    bookDetails.changeSliverBar.value = true;
    return Scaffold(
        body: Obx(
      () => BookDrawer(
        bodySize: 140,
        radius: 40,
        key: drawer.drawerKeyDetails.value,
        hasClone: drawer.removePageController.value,
        bodyBackgroundPeekSize: 40,
        backgroundColor: Colors.teal.shade900,
        // pass drawer widget
        drawer: DrawerItem(),
        child: CustomScrollView(
          controller: bookDetails.controller,
          slivers: <Widget>[
            OpenAndCloseDetailsDrawer(
              title: title,
              image: image,
            ), //SliverAppBar
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '$title',
                          style: GoogleFonts.ptSans(
                              fontSize: 16,
                              color: Theme.of(context).highlightColor),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('${removeBracket(author)}',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            getRating(rating.toString()),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('${rating == null ? 0 : rating}',
                                  style: GoogleFonts.ptSans(
                                      fontSize: 12,
                                      color: Colors.yellow.shade900)),
                            ),
                            if (category != null)
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 0.2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text('${removeBracket(category)}',
                                      style: GoogleFonts.ptSans(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .highlightColor)),
                                ),
                              ),
                            if (amount != null)
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text('\$$amount',
                                      style: GoogleFonts.ptSans(
                                          fontSize: 12,
                                          color: Theme.of(context).cardColor)),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Theme.of(context).disabledColor,
                                    width: 0.3),
                                bottom: BorderSide(
                                    color: Theme.of(context).disabledColor,
                                    width: 0.3)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 14.0, bottom: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: bookDetails.favorite.value
                                            ? GestureDetector(
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                                onTap: () {
                                                  bookDetails.onDeleteFavorite(
                                                      bookId,
                                                      Get.find<AuthController>()
                                                          .userId
                                                          .value);
                                                },
                                              )
                                            : GestureDetector(
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                                onTap: () {
                                                  bookDetails.onSubmitFavorite(
                                                    bookId,
                                                    Get.find<AuthController>()
                                                        .userId
                                                        .value,
                                                    title,
                                                    image,
                                                    rating,
                                                    author,
                                                    category,
                                                    createdAt,
                                                    description,
                                                    buy,
                                                    available == 'FOR_SALE'
                                                        ? 'FOR_SALE'
                                                        : 'NOT_FOR_SALE',
                                                    amount,
                                                    url,
                                                    preview,
                                                  );
                                                },
                                              ),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, bottom: 3),
                                          child: Text('Favorite',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.calendar_today,
                                          color:
                                              Theme.of(context).disabledColor,
                                          size: 20,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, bottom: 3),
                                          child: Text('${time(createdAt)}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.share,
                                            color:
                                                Theme.of(context).disabledColor,
                                            size: 20,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0, bottom: 3),
                                            child: Text('Share',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    if (buy == null)
                                      snackBarWarning(
                                          'warning',
                                          'this book cant be shared, not for sale',
                                          false);
                                    else
                                      share(buy, title);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'About This Book',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('$description',
                            style: GoogleFonts.ptSans(
                                fontSize: 16,
                                wordSpacing: 0.8,
                                color: Theme.of(context)
                                    .highlightColor
                                    .withOpacity(0.7))),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Theme.of(context).primaryColor),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.read_more,
                                            color: Theme.of(context).cardColor,
                                            size: 14,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0, bottom: 1),
                                            child: Text('Read Now',
                                                style: GoogleFonts.caudex(
                                                    fontSize: 11,
                                                    color: Theme.of(context)
                                                        .cardColor)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () => launchURL(url)),
                            GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Theme.of(context)
                                          .toggleableActiveColor),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.preview,
                                            color: Theme.of(context).cardColor,
                                            size: 14,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0, bottom: 1),
                                            child: Text('Preview',
                                                style: GoogleFonts.caudex(
                                                    fontSize: 11,
                                                    color: Theme.of(context)
                                                        .cardColor)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () => launchURL(preview)),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:  available == 'FOR_SALE' ?Colors.blue.shade700 : Theme.of(context).disabledColor),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.shop,
                                          color: Theme.of(context).cardColor,
                                          size: 14,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, bottom: 1),
                                          child: available == 'FOR_SALE'
                                              ? Text('Buy Now',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1)
                                              : Text('Not for Sale',
                                                  style: GoogleFonts.caudex(
                                                      fontSize: 11,
                                                      color: Theme.of(context)
                                                          .cardColor)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (buy == null)
                                  snackBarWarning(
                                      'warning', 'not for sale', false);
                                else
                                  share(buy, title);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

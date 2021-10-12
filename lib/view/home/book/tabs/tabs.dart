import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/view/widget/book/image.dart';
import 'package:bookapp/view/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final books = Get.put(BooksController());

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Row(
        children: [
          for (var i = 0; i < books.name.length; i++)
            Obx(() => GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: books.selectedTab.contains(books.name[i])
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .disabledColor
                                .withOpacity(0.09)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.book,
                                size: 14,
                                color: books.selectedTab.contains(books.name[i])
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.2),
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.0, right: 10),
                                child: Text(
                                  books.name[i],
                                  style: books.selectedTab.contains(books.name[i])
                                      ? Theme.of(context).textTheme.headline1
                                      : Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    books.query.value = i;
                    books.handleButton(books.name[i]);
                    books.loadBookTabs();
                  },
                )),
        ],
      ),
      TabDataList(),
    ]);
  }
}

class TabDataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      2,
      3,
      4,
      5,
      6,
      7,
      7,
      7,
      7
    ];
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ...list
            .map((e) => TabDataBooks(
                  e: e,
                ))
            .toList(),
        SizedBox(
          height: 20,
        ),
        Loader(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class TabDataBooks extends StatelessWidget {
  final e;

  const TabDataBooks({Key? key, this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Container(
            height:90,
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
                    padding: const EdgeInsets.only(
                        top: 4.0, left: 68.0, right: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child:  Text(
                            'Dirty Woman Harry Porty',
                            style: GoogleFonts.ptSans(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).highlightColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 2,),
                    Text(
                     "Nobody knows yet that she is a murderer... Abandoned at the gates of a London park one winter's night in 1850, baby Lily Mortimer is saved by a young police constable and taken to the London Foundling Hospital. Lily is fostered by an affectionate farming family in rural Suffolk, enjoying a brief childhood",
                      style: GoogleFonts.ptSans(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                        SizedBox(height: 2,),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Text('Rating - 4.5',style: Theme.of(context).textTheme.bodyText1,)
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Icon(
                                    Icons.star_rate,
                                    size: 14,
                                    color: Colors.yellow.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(left: 0,top: 2, child:  bookImage(
                      'https://i.cbc.ca/1.5295533.1569346085!/fileImage/httpImage/image.png_gen/derivatives/original_780/book-cover-the-glass-hotel-by-emily-st-john-mandel.png'),
                  ),
                       ],
              ),
            ),
          ),
          onTap: () {},
        );
        // Container(
        //   child: Positioned(
        //       top: 0,
        //       bottom: 0,
        //       child: bookImage(
        //           'https://i.cbc.ca/1.5295533.1569346085!/fileImage/httpImage/image.png_gen/derivatives/original_780/book-cover-the-glass-hotel-by-emily-st-john-mandel.png')),
        // ),
        // SizedBox(height: 20,)

  }
}

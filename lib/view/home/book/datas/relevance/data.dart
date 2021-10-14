import 'package:bookapp/core/model/user/books/booksDataModel/books_data.dart';
import 'package:bookapp/service/api/api_utils/api_routes.dart';
import 'package:bookapp/view/utils/remove_bracket_from_authors.dart';
import 'package:bookapp/view/utils/switch_rating.dart';
import 'package:bookapp/view/widget/book/data_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataBooks extends StatelessWidget {
  final Item e;
  const DataBooks({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            width: 120,
            height: 232,
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 120,
              height: 140,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: new DecorationImage(
                  image: NetworkImage(
                    e.volumeInfo!.imageLinks == null
                        ? ApiRoutes.bookNoImage
                        : '${e.volumeInfo!.imageLinks!.thumbnail}',
                    scale: 1.0,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              width: 120,
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${e.volumeInfo!.title}',
                    style: GoogleFonts.ptSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${removeBracket(e.volumeInfo!.authors)}',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  getRating(e.volumeInfo!.averageRating.toString())
                ],
              ),
            ),
          ),
        ],
      ),
       onTap: () => dataNavigate(e)
    );
  }
}

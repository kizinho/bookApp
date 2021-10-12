import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Relevance extends StatelessWidget {
  const Relevance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Relevance Books',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(height: 15,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10.0,
            spacing: 10.0,
            children: [
              ...list
                  .map((e) => DataBooks(
                        e: e,
                      ))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}

class DataBooks extends StatelessWidget {
  final e;
  const DataBooks({Key? key, this.e}) : super(key: key);

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
                    'https://m.media-amazon.com/images/I/51kLy738-+L.jpg',
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
                   'Dirty Woman Harry',
                    style: GoogleFonts.ptSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Rose Tremain',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                    Icon(Icons.star_rate,size: 14, color: Colors.yellow.shade700,),
                      Icon(Icons.star_rate,size: 14, color: Colors.yellow.shade700,),
                      Icon(Icons.star_rate,size: 14, color: Colors.yellow.shade700,),
                      Icon(Icons.star_rate,size: 14, color: Colors.yellow.shade700,),
                      Icon(Icons.star_rate,size: 14, color: Colors.yellow.shade700,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {

      },
    );
  }
}

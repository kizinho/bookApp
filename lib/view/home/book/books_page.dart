import 'package:bookapp/view/widget/drawer/open_close_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: headerNav('BOOKAPP', context),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


              ],
            ),
          ),
        ));
  }
}

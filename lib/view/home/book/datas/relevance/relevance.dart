import 'package:bookapp/core/controller/get/books/books_controller.dart';
import 'package:bookapp/view/home/book/datas/relevance/data.dart';
import 'package:bookapp/view/home/book/datas/relevance/skeleton_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final relevance = Get.find<BooksController>();

class Relevance extends StatelessWidget {
  const Relevance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relevance Books',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: 15,
            ),
            if (relevance.booksData.value == null)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    ...relevance.list
                        .map((e) => RelevanceSkeleton())
                        .toList(),
                  ],
                ),
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    ...relevance.booksData.value!.items!
                        .map((e) => DataBooks(
                              e: e,
                            ))
                        .toList(),
                  ],
                ),
              ),
          ],
        ));
  }
}

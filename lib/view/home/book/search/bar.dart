import 'package:booksfinder/core/controller/get/books/books_controller.dart';
import 'package:booksfinder/core/controller/get/books/search_controller.dart';
import 'package:booksfinder/core/controller/get/drawer/drawer_controller.dart';
import 'package:booksfinder/view/home/book/search/search_details.dart';
import 'package:booksfinder/view/widget/snackbar/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

final books = Get.find<BooksController>();
final search = Get.put(SearchController());

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: searchFormKey,
          child: Expanded(
            child: TextFormField(
              style: Theme.of(context).textTheme.headline3,
              controller: books.searchController,
              enableSuggestions: true,
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: 'Search keywords...',
                alignLabelWithHint: true,
                focusColor: Theme.of(context).disabledColor,
                fillColor: Theme.of(context).shadowColor,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).disabledColor,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).shadowColor, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).shadowColor, width: 1.0),
                ),
                labelStyle: Theme.of(context).textTheme.overline,
              ),
              textInputAction: TextInputAction.search,
              validator: (value) {
                return value!.isEmpty ? 'Keywords can not be empty' : null;
              },
              onFieldSubmitted: (v) {
                if (searchFormKey.currentState!.validate()) {
                  Get.find<DrawerAppController>()
                      .automaticallyImplyLeading
                      .value = true;
                  books.searchTitle.value = books.searchController.text;
                  Get.to(() => SearchDetails());
                  search.getSearchResult(books.searchValue.value.toLowerCase(),
                      books.searchMaxResult.value, books.searchTitle.value);
                }
              },
            ),
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              alignment: Alignment.center,
              height: 38,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).primaryColor),
              child: FaIcon(FontAwesomeIcons.slidersH,
                  size: 23, color: Theme.of(context).canvasColor),
            ),
          ),
          onTap: () {
            filterBottomSheet(context);
          },
        )
      ],
    );
  }

  filterBottomSheet(context) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Text(
                            'Filter your search',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                CupertinoIcons.clear_circled,
                                size: 20,
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                            onTap: () => Get.back(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.08),
                  thickness: 1,
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.0, // distance between rows
                    spacing: 10.0,
                    children: [
                      for (var i = 0; i < books.filterName.length; i++)
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: books.selectedFilter
                                      .contains(books.filterName[i])
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.09),
                              boxShadow: [
                                if (books.selectedFilter
                                    .contains(books.filterName[i]))
                                  const BoxShadow(
                                    color: Colors.tealAccent,
                                    blurRadius: 10,
                                  ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                books.filterName[i],
                                style: books.selectedFilter
                                        .contains(books.filterName[i])
                                    ? Theme.of(context).textTheme.headline1
                                    : Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ),
                          onTap: () {
                            books.handleFilter(books.filterName[i]);
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red.shade700,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'clear',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            )),
                      ),
                      onTap: () {
                        books.selectedFilter.clear();
                      },
                    ),
                    GestureDetector(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Search',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            )),
                      ),
                      onTap: () {
                        if (books.searchController.text.isNotEmpty) {
                          Get.find<DrawerAppController>()
                              .automaticallyImplyLeading
                              .value = true;
                          books.searchTitle.value = books.searchController.text;
                          Get.to(() => SearchDetails());
                          search.getSearchResult(
                              books.searchValue.value.toLowerCase(),
                              books.searchMaxResult.value,
                              books.searchTitle.value);
                        } else {
                          Get.back();
                          snackBarWarning('Search error!',
                              'Keywords field can not be empty', false);
                        }
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
      backgroundColor: Theme.of(context).cardColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(21),
        topLeft: Radius.circular(21),
      )),
    );
  }
}

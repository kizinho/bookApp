import 'package:get/get.dart';

class BooksController extends GetxController {
  RxBool status = false.obs;
  RxList name = [].obs;
  RxList selectedTab = [].obs;
  RxInt query = 0.obs;
  @override
  void onInit() {
    myList();
    selectedTab.value = ['Latest'];
    loadBookTabs();
    super.onInit();
  }

  final listsFinal = [
    'Latest',
    'My Favorites',
  ];
  myList() {
    name.value = listsFinal;
  }

  handleButton(i) {
    if (i == 'My Favorites')
      selectedTab.remove('Latest');
    else if (i == 'Latest') selectedTab.remove('My Favorites');
    var iSelected = selectedTab.contains(i);
    if (!iSelected) selectedTab.add(i);
  }

  loadBookTabs() {
    print('this is what we use find tab at ${query.value}');
  }
}

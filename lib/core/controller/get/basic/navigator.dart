import 'package:get/get.dart';

startTimer(page) async {
  new Future.delayed(const Duration(seconds: 3), () {
    Get.offNamed(page);
  });
}

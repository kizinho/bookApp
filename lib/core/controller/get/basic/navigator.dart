import 'package:get/get.dart';

startTimer(page) async {
  new Future.delayed(const Duration(seconds: 3), () {
    Get.offAllNamed(page);
  });
}

startTimerError(page) async {
  new Future.delayed(const Duration(seconds: 3), () {
    Get.offAllNamed(page);
  });
}

import 'package:get/get.dart';

class BasicController extends GetxController {
  RxBool obscureText = true.obs;
  onTap(value) {
    obscureText.value = !value;
  }
}

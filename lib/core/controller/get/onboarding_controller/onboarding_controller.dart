import 'dart:async';

import 'package:bookapp/core/model/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  List<SliderModel> mySLides = new List<SliderModel>.empty(growable: false);
  RxInt slideIndex = 0.obs;
  final pageController = PageController();
  Timer? slideTimer;
  RxBool status = false.obs;
  RxString title = ''.obs;
  RxString desc = ''.obs;

  @override
  onInit() {
    mySLides = getSlides();
    slideTimer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (slideIndex.value < 2) {
        slideIndex.value++;
      } else {
        slideIndex.value = 0;
      }

      pageController.animateToPage(
        slideIndex.value,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    super.onInit();
    // onboarding();
  }

  @override
  onClose() {
    pageController.dispose();
    slideTimer!.cancel();
    super.onClose();
  }

  // onboarding() async {
  //   var onboardInfoCache = locator<OnboardInfoCache>();
  //   await onboardInfoCache.getOnboardDataFromStorage();
  //   if (onboardInfoCache.isOnboarding) {
  //     Navigator.pushReplacementNamed(
  //       context,
  //       RouteNames.loginScreen,
  //     );
  //   }
  // }
  setTitle(newTitle) {
    title.value = newTitle;
    print(title.value.length);
  }

  setDec(newDec) {
    desc.value = newDec;
  }
}

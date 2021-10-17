import 'dart:async';

import 'package:booksfinder/core/model/onboarding/onboarding.dart';
import 'package:booksfinder/service/api/authentication_api/authentication_api.dart';
import 'package:booksfinder/service/onboarding/onboarding_info_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../locator.dart';

class OnboardingController extends GetxController {
  var onboardApi = locator<AuthenticationApi>();
  List<SliderModel> mySLides = new List<SliderModel>.empty(growable: false);
  RxInt slideIndex = 0.obs;
  final pageController = PageController();
  Timer? slideTimer;
  RxBool status = false.obs;
  RxString title = ''.obs;
  RxString desc = ''.obs;

  @override
  onInit() {
    onboarding();
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
  }

  @override
  onClose() {
    pageController.dispose();
    slideTimer!.cancel();
    super.onClose();
  }

  onboarding() async {
    var onboardInfoCache = locator<OnboardInfoCache>();
    await onboardInfoCache.getOnboardDataFromStorage();
    if (onboardInfoCache.status != null) {
      Get.offAllNamed('books');
    }
  }

  setOnboardingSeen() async {
    var result = await onboardApi.onboarding();
    var onboardInfoCache = locator<OnboardInfoCache>();
    await onboardInfoCache.cacheOnboardResponse(result);
  }

  setTitle(newTitle) {
    title.value = newTitle;
    print(title.value.length);
  }

  setDec(newDec) {
    desc.value = newDec;
  }
}

import 'package:booksfinder/core/controller/get/onboarding_controller/onboarding_controller.dart';
import 'package:booksfinder/view/onboarding/slider_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final onboarding = Get.put(OnboardingController());

class Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView(
              physics: ClampingScrollPhysics(),
              controller: onboarding.pageController,
              onPageChanged: (index) {
                onboarding.slideIndex.value = index;
              },
              children: onboarding.mySLides
                  .map(
                    (e) => SlideTile(
                      imagePath: e.getImageAssetPath(),
                      title: e.getTitle(),
                      desc: e.getDesc(),
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}

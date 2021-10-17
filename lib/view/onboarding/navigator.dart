import 'package:booksfinder/core/controller/get/onboarding_controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final onboarding = Get.find<OnboardingController>();

class NavigatorItem extends StatelessWidget {
  const NavigatorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Obx(() => Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: onboarding.slideIndex.value != 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                            color: Theme.of(context).disabledColor,
                          ),
                          onTap: () {
                            onboarding.pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                        ),
                        GestureDetector(
                          child: Text(
                            'Skip',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          onTap: () {
                            onboarding.setOnboardingSeen();
                            Get.offNamed("/books");
                          },
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Skip',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          onTap: () {
                            onboarding.setOnboardingSeen();
                            Get.offNamed("/books");
                          },
                        ),
                      ],
                    ),
            )),
      ],
    );
  }
}

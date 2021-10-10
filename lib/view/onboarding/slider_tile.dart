import 'package:bookapp/core/controller/get/onboarding_controller/onboarding_controller.dart';
import 'package:bookapp/view/onboarding/build_page_Indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final onboarding = Get.find<OnboardingController>();

class SlideTile extends StatelessWidget {
  final String? imagePath, title, desc;
  final double? width, height;

  SlideTile({this.imagePath, this.title, this.desc, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: width,
                  height: height,
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.fill,
                    scale: 1,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      title!,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(desc!,
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Obx(() => Row(
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    i == onboarding.slideIndex.value
                                        ? BuildPageIndicator(
                                            isCurrentPage: true)
                                        : BuildPageIndicator(
                                            isCurrentPage: false),
                                ],
                              )),
                        ),
                        Obx(() => onboarding.slideIndex.value != 2
                            ? Container(
                                width: 90,
                                height: 44,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextButton(
                                  onPressed: () {
                                    onboarding.pageController.animateToPage(
                                        onboarding.slideIndex.value + 1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                  },
                                  child: Text("NEXT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ),
                              )
                            : Container(
                                width: 90,
                                height: 44,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextButton(
                                  onPressed: () {
                                    onboarding.setOnboardingSeen();
                                    Get.offNamed("login");
                                  },
                                  child: Text("START",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ),
                              ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

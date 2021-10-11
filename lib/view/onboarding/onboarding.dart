import 'package:bookapp/view/onboarding/navigator.dart';
import 'package:bookapp/view/onboarding/page_view.dart';
import 'package:flutter/material.dart';



class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  NavigatorItem(),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      Pages(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

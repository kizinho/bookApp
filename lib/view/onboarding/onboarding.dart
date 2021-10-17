import 'package:booksfinder/view/onboarding/navigator.dart';
import 'package:booksfinder/view/onboarding/page_view.dart';
import 'package:flutter/material.dart';



class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color:  Theme.of(context).backgroundColor,
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
      ),
    );
  }
}

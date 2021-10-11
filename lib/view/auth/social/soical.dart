import 'package:bookapp/core/controller/post/auth/apple.dart';
import 'package:bookapp/core/controller/post/auth/google_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

final google = Get.put(GoogleController());
final apple = Get.put(AppleController());

class Social extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    width: 0.8, color: Theme.of(context).bottomAppBarColor)),
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.redAccent),
              child: IconButton(
                  onPressed: () {
                    google.signInWithGoogle();
                  },
                  icon: FaIcon(FontAwesomeIcons.google,
                      size: 13, color: Theme.of(context).canvasColor)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    width: 0.8, color: Theme.of(context).bottomAppBarColor)),
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withOpacity(0.5)),
              child: IconButton(
                  onPressed: () {
                    apple.signInWithApple();
                  },
                  icon: FaIcon(FontAwesomeIcons.apple,
                      size: 13, color: Theme.of(context).canvasColor)),
            ),
          ),
        ),
      ],
    );
  }
}

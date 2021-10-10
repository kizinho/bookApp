import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                border:
                    Border.all(width: 0.8, color: Theme.of(context).bottomAppBarColor)),
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.redAccent),
              child: IconButton(
                  onPressed: () {},
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
                border:
                    Border.all(width: 0.8, color: Theme.of(context).bottomAppBarColor)),
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.lightBlueAccent),
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.twitter,
                      size: 13, color: Theme.of(context).canvasColor)),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:booksfinder/view/widget/skeleton/skeleton_container.dart';
import 'package:flutter/material.dart';

class SkeletonTabData extends StatelessWidget {
  const SkeletonTabData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Theme.of(context).cardColor,
        elevation: 0.4,
        shadowColor: Theme.of(context).primaryColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 68.0, right: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: SkeletonContainer.square(
                        width: MediaQuery.of(context).size.width, height: 8),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SkeletonContainer.square(
                        width: MediaQuery.of(context).size.width, height: 4),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SkeletonContainer.square(
                        width: MediaQuery.of(context).size.width, height: 4),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SkeletonContainer.square(
                        width: MediaQuery.of(context).size.width, height: 4),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SkeletonContainer.square(width: 30, height: 8),
                        )),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child:
                                SkeletonContainer.square(width: 10, height: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 2,
              child: SkeletonContainer.square(
                width: 60,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

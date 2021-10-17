import 'package:booksfinder/view/widget/skeleton/skeleton_container.dart';
import 'package:flutter/material.dart';

class RelevanceSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: 120,
          height: 232,
        ),
        Positioned(
            top: 0, child: SkeletonContainer.square(width: 120, height: 140)),
        Positioned(
          top: 150,
          child: Container(
            width: 120,
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SkeletonContainer.square(width: 120, height: 8),
                SizedBox(height: 2),
                SkeletonContainer.square(width: 120, height: 6),
                SizedBox(height: 5),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: SkeletonContainer.square(width: 16, height: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: SkeletonContainer.square(width: 16, height: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: SkeletonContainer.square(width: 16, height: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: SkeletonContainer.square(width: 16, height: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: SkeletonContainer.square(width: 16, height: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

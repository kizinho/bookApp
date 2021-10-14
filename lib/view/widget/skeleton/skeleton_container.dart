import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonContainer extends StatelessWidget {
  SkeletonContainer(this.width, this.height);

  final double width;
  final double height;

  const SkeletonContainer._({
    this.width = double.infinity,
    this.height = double.infinity,
    Key? key,
  }) : super(key: key);

  const SkeletonContainer.square({
    required double width,
    required double height,
  }) : this._(width: width, height: height);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
        shimmerColor: Theme.of(context).hintColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Theme.of(context).disabledColor.withOpacity(0.09),
          ),
        ),
      );
}

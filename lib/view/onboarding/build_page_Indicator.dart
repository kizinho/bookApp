
import 'package:flutter/material.dart';

class BuildPageIndicator extends StatelessWidget {
  final bool? isCurrentPage;

  const BuildPageIndicator({Key? key, this.isCurrentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage! ? 9.0 : 9.0,
      width: isCurrentPage! ? 38.0 : 9.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).indicatorColor,
        ),
        color: isCurrentPage! ? Theme.of(context).toggleableActiveColor : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
  }


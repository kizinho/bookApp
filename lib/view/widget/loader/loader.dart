import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          strokeWidth: 5,
          backgroundColor: Theme.of(context).focusColor,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          )),
    );
  }
}

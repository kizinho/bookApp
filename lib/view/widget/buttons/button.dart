import 'package:flutter/material.dart';

class SubmitButtion extends StatelessWidget {
  final text;
  const SubmitButtion({Key? key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 250,
      height: 52,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

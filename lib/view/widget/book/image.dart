import 'package:flutter/material.dart';

bookImage(String link) {
  return Container(
    width: 60,
    height: 80,
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      image: new DecorationImage(
        image: NetworkImage(
          "$link",
          scale: 1.0,
        ),
        fit: BoxFit.fill,
      ),
    ),
  );
}
import 'package:flutter/material.dart';

getRating(value) {
  switch (value) {
    case "1":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "1.5":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "2":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "2.5":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "3":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "3.5":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "4":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "4.5":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_half,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    case "5":
      return Row(
        children: [
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_rate,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
    default:
      return Row(
        children: [
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
          Icon(
            Icons.star_border,
            size: 14,
            color: Colors.yellow.shade900,
          ),
        ],
      );
  }
}

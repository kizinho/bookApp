import 'package:bookapp/view/widget/snackbar/error.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    snackBarError('Error', 'Could not launch $url', false);
  }
}

share(String url, title) {
  Share.share(url,
      subject: title, sharePositionOrigin: Rect.fromLTWH(0, 0, 1, 1));
}

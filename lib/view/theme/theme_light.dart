import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeLight = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  toggleableActiveColor: Colors.redAccent.shade700,
  //app  background color
  backgroundColor: Colors.white,
  //main color
  primaryColor: Colors.tealAccent.shade700,
  // //background bar
  unselectedWidgetColor: Colors.white,
  //inactive
  disabledColor: Colors.black.withOpacity(0.5),
  textTheme: TextTheme(
    //app welcome text
    headline1: GoogleFonts.caudex(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    headline2: GoogleFonts.caudex(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
    headline3: GoogleFonts.caudex(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),

    headline4: GoogleFonts.caudex(
        fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),

    headline5: GoogleFonts.almarai(fontSize: 12, color: Colors.white),
    headline6: GoogleFonts.caudex(fontSize: 11.5, color: Colors.black54),

    subtitle1: GoogleFonts.caudex(fontSize: 15, color: Colors.black),
    subtitle2: GoogleFonts.caudex(fontSize: 15, color: Colors.tealAccent.shade700),

    bodyText1: GoogleFonts.caudex(fontSize: 12, color: Colors.black87),
    bodyText2: GoogleFonts.caudex(
      fontSize: 12,
      color: Colors.black.withOpacity(0.5),
    ),
    button: GoogleFonts.caudex(fontSize: 20, color: Colors.tealAccent.shade700),
    caption: GoogleFonts.caudex(
        fontSize: 12, color: Colors.black),
    overline: GoogleFonts.caudex(
        fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
  ),
  indicatorColor: Colors.grey,
  //app button create account color
  canvasColor: Colors.white,
  cardColor: Colors.white,
  focusColor: Colors.teal.shade200,
  shadowColor: Colors.white,
  hintColor: Colors.black,
  bottomAppBarColor: Colors.white10,
  highlightColor: Colors.white,
  primaryColorDark: Colors.white10,
);

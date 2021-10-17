import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeDark = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    color:  Colors.black.withOpacity(0.4),
    iconTheme: IconThemeData(color: Colors.white.withOpacity(0.6)),
  ),
  scaffoldBackgroundColor: Colors.white,
  toggleableActiveColor: Colors.redAccent.shade700,
  //app  background color
  backgroundColor: Colors.black,
  //main color
  primaryColor: Colors.tealAccent.shade700,
  // //background bar
  unselectedWidgetColor: Colors.white,
  //inactive
  disabledColor: Colors.white.withOpacity(0.8),
  textTheme: TextTheme(
    //app welcome text
    headline1: GoogleFonts.caudex(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    headline2: GoogleFonts.caudex(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
    headline3: GoogleFonts.caudex(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),

    headline4: GoogleFonts.caudex(
        fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),

    headline5: GoogleFonts.almarai(fontSize: 16, color: Colors.white),


    headline6: GoogleFonts.caudex(fontSize: 12, color: Colors.white.withOpacity(0.8)),

    subtitle1: GoogleFonts.caudex(fontSize: 12, color: Colors.white),
    subtitle2: GoogleFonts.caudex(fontSize: 16, color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold),

    bodyText1: GoogleFonts.caudex(fontSize: 12, color: Colors.white),
    bodyText2: GoogleFonts.caudex(
      fontSize: 12,
      color: Colors.white.withOpacity(0.5),
    ),
    button: GoogleFonts.caudex(fontSize: 20, color: Colors.tealAccent.shade700),
    caption: GoogleFonts.caudex(
        fontSize: 12, color: Colors.white),
    overline: GoogleFonts.caudex(
        fontSize: 12, color:  Colors.white.withOpacity(0.4)),
  ),
  indicatorColor: Colors.white54,
  canvasColor: Colors.white,
  cardColor: Colors.black,
  focusColor: Colors.teal.shade200,
  shadowColor: Colors.black12.withOpacity(0.4),
  hintColor: Colors.grey.withOpacity(0.4),
  bottomAppBarColor: Colors.grey.withOpacity(0.4),
  highlightColor: Colors.black,
  primaryColorDark: Colors.black.withOpacity(0.5),
);

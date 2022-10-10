import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = const Color(0xff000633);
  static Color accentColor = const Color(0xff0065ff);
  static Color bgColor = Color(0xffe2e2ff);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade200,
    Colors.blueGrey.shade100
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    // color: Colors.white,
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    // color: Colors.white,
  );

  static TextStyle dateTitle = GoogleFonts.nunito(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    // color: Colors.white,
  );
}

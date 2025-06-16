import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(color: Colors.black87),
    ),
  );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}

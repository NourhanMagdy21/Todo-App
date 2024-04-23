import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static bool isDark = true;
  static Color primaryColor = const Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xffDFECDB),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      onPrimary: primaryColor,
      onSecondary: const Color(0xffDFECDB),
      primary: primaryColor,
      background: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: primaryColor,
      elevation: 0.0,
      centerTitle: false,
      toolbarHeight: 140,
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 32,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        size: 26,
        color: Colors.grey.shade700,
      ),
      unselectedItemColor: Colors.grey.shade700,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 0.0,
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodySmall: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
  );
}

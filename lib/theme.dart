import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyText1: const TextStyle(color: Colors.black),
      bodyText2: const TextStyle(color: Colors.grey),
      headline1: const TextStyle(
        color: Colors.black,
        fontSize: 26,
        letterSpacing: 1.8,
        fontWeight: FontWeight.bold,
      ),
      headline2: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        letterSpacing: 1.8,
      ),
      headline3: const TextStyle(color: Colors.grey),
      //  FOR THE WEATHER ICONS.
      headline4: const TextStyle(
        fontSize: 80,
        color: Colors.black,
      ),
      headline5: const TextStyle(
        color: Colors.grey,
        fontSize: 10,
      ),
      headline6: const TextStyle(
        color: Colors.black,
        fontSize: 10,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.grey.shade400,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.transparent,
      circularTrackColor: Colors.grey,
      refreshBackgroundColor: Colors.black,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyText1: const TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.grey.shade600),
      headline1: const TextStyle(
        color: Colors.white,
        fontSize: 26,
        letterSpacing: 1.8,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 16,
        letterSpacing: 1.8,
      ),
      headline3: const TextStyle(color: Colors.grey),
      headline4: const TextStyle(
        fontSize: 80,
        color: Colors.white,
      ),
      headline5: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 10,
      ),
      headline6: const TextStyle(
        color: Colors.white,
        fontSize: 10,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.white12,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
      circularTrackColor: Colors.grey,
      refreshBackgroundColor: Colors.white,
    ),
  );
}

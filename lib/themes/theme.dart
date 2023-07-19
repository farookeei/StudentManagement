import 'package:flutter/material.dart';

class Themes {
// Light Theme Colors
  static const Color primaryColorLight = Color(0xFF2196F3); // Blue

// Dark Theme Colors
  static const Color primaryColorDark = Color(0xFF2196F3); // Blue

// Theme Data
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryColorLight,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(color: Colors.grey[900]),
      titleTextStyle: TextStyle(
        fontSize: 18,
        letterSpacing: -0.6,
        wordSpacing: 1,
        fontWeight: FontWeight.w700,
        color: Colors.grey[900],
      ),
    ),
    brightness: Brightness.light,
    primaryColor: primaryColorLight,
    fontFamily: 'EuclidCircularB',
    colorScheme: const ColorScheme.light(
        primary: primaryColorLight, secondary: Colors.black),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        letterSpacing: -0.6,
        wordSpacing: 1,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    brightness: Brightness.dark,
    fontFamily: 'EuclidCircularB',
    primaryColor: primaryColorDark,
    colorScheme: const ColorScheme.dark(
        primary: primaryColorDark, secondary: Colors.white),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}

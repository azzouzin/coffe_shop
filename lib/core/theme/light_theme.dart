import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    },
  ),
  fontFamily: 'Sora',
  primaryColor: Color(0xFFC67C4E),
  colorScheme: ColorScheme.light(
    primary: Color(0xFFC67C4E),
    secondary: Color(0xFFEDD6C8),
    background: Color(0xFFF9F2ED),
    surface: Color(0xFFE3E3E3),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Color(0xFF313131)),
    bodyLarge: TextStyle(color: Color(0xFF313131), fontSize: 12),
    bodyMedium: TextStyle(color: Color(0xFFA2A2A2), fontSize: 14),
    bodySmall: TextStyle(color: Color(0xFFA2A2A2)),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 48,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
);

class LightThemeConstants {
  static const Color primaryColor = Color(0xFFC67C4E);
  static const Color secondaryColor = Color(0xFFEDD6C8);
  static const Color backgroundColor = Color(0xFFF9F2ED);
  static const Color surfaceColor = Color(0xFFE3E3E3);
  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = Colors.black;
  static List<Color> gradientColors = [Color(0xFFC67C4E), Color(0xFFEDD6C8)];
  static List<Color> appBarGredients = [
    Color(0xFF111111),
    Color.fromARGB(255, 30, 30, 30),
  ];
}

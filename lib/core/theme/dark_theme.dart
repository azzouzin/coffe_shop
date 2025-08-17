import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Sora',
  primaryColor: Color(0xFFC67C4E),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFC67C4E),
    secondary: Color(0xFFEDD6C8),
    background: Color(0xFF313131),
    surface: Color(0xFFE3E3E3),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Color(0xFFF9F2ED)),
    bodyLarge: TextStyle(color: Color(0xFFF9F2ED)),
  ),
);

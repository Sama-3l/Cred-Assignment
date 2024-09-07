import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primaryColor: const Color(0xff0A0A0A),
    indicatorColor: const Color(0xffffffff),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffffffff),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        shadowColor: const Color(0xffffffff),
      ),
    ),
    primaryTextTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "Gilroy-ExtraBold",
        fontSize: 24,
      ),
      displayMedium: TextStyle(
        fontFamily: "Cirka-Bold",
        fontSize: 24,
        letterSpacing: 1,
      ),
      displaySmall: TextStyle(
        fontFamily: "Gilroy-ExtraBold",
        fontSize: 32,
      ),
      labelMedium: TextStyle(
        fontFamily: "Gilroy-ExtraBold",
        letterSpacing: 0.2,
        color: Color(0xff0D0D0D),
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        fontFamily: "Gilroy-Bold",
        letterSpacing: 0.2,
        color: Color(0xffffffff),
        fontSize: 16,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Gilroy-ExtraBold",
        letterSpacing: 0.2,
        color: Color(0xff4D4D4D),
        fontSize: 16,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Gilroy-Bold",
        letterSpacing: 0.2,
        color: Color(0xff4D4D4D),
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontFamily: "Gilroy-Medium",
        letterSpacing: 0.2,
        color: Color(0xffffffff),
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontFamily: "Gilroy-Medium",
        letterSpacing: 0.2,
        color: Color(0x4dffffff),
        fontSize: 14,
      ),
    ));

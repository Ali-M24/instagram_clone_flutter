import 'package:flutter/material.dart';
import 'package:instgram_clone/constant/Colors.dart';

ThemeData AppTheme() {
  return ThemeData(
    textTheme: getTextTheme(),
    elevatedButtonTheme: getElevatedButtonTheme(),
  );
}

TextTheme getTextTheme() {
  return TextTheme(
    headlineSmall: TextStyle(
      fontFamily: 'GB',
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: whiteColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'GB',
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: whiteColor,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'GB',
      fontSize: 20,
      color: whiteColor,
    ),
  );
}

ElevatedButtonThemeData getElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xffF35383),
      elevation: 0,
      minimumSize: Size(129, 46),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      textStyle: TextStyle(
        fontFamily: 'GB',
        fontSize: 16.0,
      ),
    ),
  );
}

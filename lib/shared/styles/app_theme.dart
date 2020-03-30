import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(elevation: 0.0),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Inter',
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF101D15),
      ),
      subtitle2: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 19.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF101D15),
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF101D15),
      ),
      headline4: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Color(0xFF101D15),
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        color: Color(0xFF3F4441),
      ),
    ),
  );
}

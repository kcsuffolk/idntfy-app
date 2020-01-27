import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Inter',
    textTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF101D15),
      ),
      subtitle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 19.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF101D15),
      ),
      subhead: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF101D15),
      ),
      display1: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Color(0xFF101D15),
      ),
      body1: TextStyle(
        fontSize: 16.0,
        color: Color(0xFF3F4441),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 4, 0, 111),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Berry",
        fontSize: 40,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Berry",
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.fromLTRB(0, 8, 0, -2),
      filled: true,
      fillColor: const Color.fromARGB(152, 0, 0, 0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
    ),
  );
}

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
      headlineSmall: TextStyle(
        fontFamily: "Berry",
        fontSize: 14,
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      filled: true,
      fillColor: const Color.fromARGB(152, 0, 0, 0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(140, 40),
        backgroundColor: const Color.fromARGB(180, 47, 0, 117),
        side: BorderSide(
          color: const Color.fromARGB(180, 255, 193, 7),
          width: 5,
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ),
  );
}

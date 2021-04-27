import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final dark = ThemeData(
    fontFamily: 'Helvetica',
    scaffoldBackgroundColor: Color(0xFF21272C),
    primaryColor: Color(0xFF1DB854),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 33,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

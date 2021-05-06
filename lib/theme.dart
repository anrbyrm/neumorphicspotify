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
      headline2: TextStyle(
        fontSize: 22,
        color: Colors.white.withOpacity(.8),
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 27,
        color: Colors.white.withOpacity(.8),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class CustomTextTheme {
  static TextStyle bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        );
  }
}

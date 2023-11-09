import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "sunflower",
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.black87)));
}

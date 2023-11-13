import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "sunflower",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.black87)),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey),
    gapPadding: 10,
  );
  OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.redAccent),
    gapPadding: 10,
  );
  OutlineInputBorder outlineInputFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color(0xff8F93EA)),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    focusedBorder: outlineInputFocusBorder,
    errorBorder: outlineInputErrorBorder,
    border: outlineInputBorder,
  );
}

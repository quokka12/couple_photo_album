import 'package:flutter/material.dart';
import 'package:photo_album/config/font/my_font_size.dart';

class MyFontStyle {
  static TextStyle title3() {
    return TextStyle(color: Colors.black87, fontSize: MyFontSize.H3);
  }

  static TextStyle underline() {
    return TextStyle(
        color: Color(0xff808080), fontSize: MyFontSize.BODY, decoration: TextDecoration.underline);
  }
}

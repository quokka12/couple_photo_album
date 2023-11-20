import 'package:flutter/material.dart';

import '../../config/font/my_font_style.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('설정', style: MyFontStyle.title3()),
        elevation: 1,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('준비중입니다.'),
      ),
    );
  }
}

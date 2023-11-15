import 'package:flutter/material.dart';

import '../../config/font/font_size.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('설정', style: TextStyle(fontSize: FontSize.H3, color: Colors.black87)),
        elevation: 1,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../config/font/my_font_size.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 5),
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)],
      ),
      child: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.photo_album_rounded, size: 28), text: '우리의 추억'),
          Tab(icon: Icon(Icons.favorite_rounded, size: 28), text: '우리가 만난 시간'),
          Tab(icon: Icon(Icons.settings, size: 28), text: '설정'),
        ],
        labelColor: Color(0xffFF4156), //Color(0xffe66a77)
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: MyFontSize.BODY,
          fontFamily: "sunflower",
        ),
        indicatorColor: Colors.transparent,
      ),
    );
  }
}

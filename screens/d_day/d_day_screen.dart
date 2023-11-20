import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../config/font/my_font_size.dart';
import '../../config/size/widget_size.dart';

class DDayScreen extends StatelessWidget {
  DDayScreen({super.key});

  final now = DateTime.now(); //현재 날짜 가져오기
  String date = "20180203"; //처음 사귀었던 날짜

  @override
  Widget build(BuildContext context) {
    String dDay = 'D+${int.parse(now.difference(DateTime.parse(date)).inDays.toString())}';
    return Scaffold(
      backgroundColor: Color(0xffFCC8D1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Text('우리가 처음 만난 날', style: TextStyle(fontSize: MyFontSize.H2, color: Colors.white)),
              Text('2018.02.03', style: TextStyle(fontSize: MyFontSize.H3, color: Colors.white)),
              Text(dDay, style: TextStyle(fontSize: MyFontSize.H2, color: Colors.white)),
              Lottie.asset("assets/animations/dday.json",
                  width: WidgetSize.ratioOfVertical(context, 0.4)),
              Image.asset(
                'assets/images/dday.png',
                height: WidgetSize.ratioOfHorizontal(context, 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

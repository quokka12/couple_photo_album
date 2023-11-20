import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/font/my_font_size.dart';
import '../../../config/font/my_font_style.dart';
import '../../../controller/camera_controller.dart';

class ViewWidget extends StatelessWidget {
  ViewWidget({super.key});
  CameraController cameraController = CameraController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('스토리 제목', style: TextStyle(fontSize: MyFontSize.H4)),
                  ],
                ),
                SizedBox(height: 10),
                Text('장소 이름 : 테스트 장소', style: TextStyle(fontSize: MyFontSize.BODY)),
                SizedBox(height: 5),
                Text('장소 주소 : 경기도 시흥시 정왕동',
                    style: TextStyle(fontSize: MyFontSize.SMALLBODY, color: Color(0xff808080))),
                SizedBox(height: 15),
                Text('하루하루를 마지막이라고 생각하라.그러면 예측할 수 없는 시간은그대에게 더 많은 시간을 줄 것이다. - 호레스',
                    style: TextStyle(fontSize: MyFontSize.SMALLBODY)),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++) ...[
                        Image.asset(
                          'assets/images/Harvie.jpeg',
                          width: 200,
                          height: 150,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: 5),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('추억 삭제', style: MyFontStyle.underline()),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

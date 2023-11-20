import 'package:flutter/material.dart';

import '../../../config/font/my_font_size.dart';
import '../../../config/size/widget_size.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/logo.jpeg',
                width: WidgetSize.ratioOfHorizontal(context, 1),
                height: WidgetSize.ratioOfHorizontal(context, 0.25),
                fit: BoxFit.fitWidth,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, left: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Test입니다.",
                    style: TextStyle(
                      fontSize: MyFontSize.BODY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2023-11-11",
                    style: TextStyle(
                      fontSize: MyFontSize.BODY,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff808080),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

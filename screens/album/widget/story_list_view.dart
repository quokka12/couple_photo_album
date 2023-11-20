import 'package:flutter/material.dart';
import 'package:photo_album/screens/album/widget/story_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/size/widget_size.dart';

class StoryListView extends StatelessWidget {
  String category = '';
  StoryListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 3000)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return StoryCard();
                    }),
              );
            }
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: WidgetSize.ratioOfHorizontal(context, 1),
                              height: WidgetSize.ratioOfHorizontal(context, 0.25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12), color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      height: WidgetSize.ratioOfHorizontal(context, 0.03),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: WidgetSize.ratioOfHorizontal(context, 0.03),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photo_album/screens/album/widget/story_card.dart';

class StoryListView extends StatelessWidget {
  String category = '';
  StoryListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            for (int i = 0; i < 4; i++) StoryCard(),
          ],
        ),
      ),
    );
  }
}

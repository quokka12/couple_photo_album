import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_album/screens/add_story/widget/add_story_form.dart';

import '../../config/font/my_font_size.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SafeArea(
          child: Container(
            width: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey, offset: Offset(0, 2))],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.navigate_before, size: 36),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      '스토리 추가',
                      style: TextStyle(fontSize: MyFontSize.H4),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))],
            ),
            child: AddStoryForm(),
          ),
        ),
      ),
    );
  }
}

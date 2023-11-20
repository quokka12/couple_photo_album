import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_album/screens/add_story/widget/add_story_form.dart';

import '../../config/font/my_font_style.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('스토리 추가', style: MyFontStyle.title3()),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before_rounded, color: Colors.black87, size: 40),
          onPressed: () => context.pop(),
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

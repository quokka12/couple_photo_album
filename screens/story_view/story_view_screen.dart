import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_album/screens/story_view/widget/view_widget.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before_rounded, color: Colors.black87, size: 40),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.JPG"),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
            color: Colors.black),
        alignment: Alignment.bottomCenter,
        child: ViewWidget(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photo_album/screens/album/album_screen.dart';
import 'package:photo_album/screens/setting/setting_screen.dart';

import '../d_day/d_day_screen.dart';
import 'widget/bottom_bar.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AlbumScreen(),
            DDayScreen(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

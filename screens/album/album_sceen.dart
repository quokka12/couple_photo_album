import 'package:flutter/material.dart';
import 'package:photo_album/screens/album/widget/post_list_view.dart';

import '../../config/font/font_size.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  String selectedCategory = "";
  var category = ['특별한 추억', '명소', '식당', '카페', '놀거리', '숙소', 'sksksksksk'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('우리의 추억 리스트', style: TextStyle(fontSize: FontSize.H3, color: Colors.black87)),
          shadowColor: Colors.grey,
          elevation: 0,
        ),
        body: SizedBox(
          child: Column(
            children: [
              categoryHelper(),
              Expanded(
                flex: 9,
                child: PostListView(category: ''),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xffFF4156),
          label: Text(
            '추억 등록하기',
            style: TextStyle(fontSize: FontSize.BODY),
          ),
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget categoryHelper() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Row(
          children: [
            for (int i = 0; i < category.length; i++)
              GestureDetector(
                onTap: () => setState(() => selectedCategory = category[i]),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedCategory == category[i] ? Color(0xffFF4156) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 2),
                    ],
                  ),
                  child: Text(
                    category[i],
                    style: TextStyle(
                        fontSize: FontSize.BODY,
                        color: selectedCategory == category[i] ? Colors.white : Colors.black87),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

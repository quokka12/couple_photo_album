import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_album/config/router/route_names.dart';
import 'package:photo_album/screens/album/widget/story_list_view.dart';

import '../../config/font/font_size.dart';
import '../../controller/category_controller.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('진지커플 스토리', style: TextStyle(fontSize: FontSize.H3, color: Colors.black87)),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: Colors.black87,
              size: 32,
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
            categoryHelper(),
            Expanded(
              flex: 9,
              child: StoryListView(category: ''),
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
        onPressed: () => context.pushNamed(RouteNames.addStory),
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
            for (int i = 0; i < CategoryController.category.length; i++)
              GestureDetector(
                onTap: () => setState(() => selectedCategory = CategoryController.category[i]),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedCategory == CategoryController.category[i]
                        ? Color(0xffFF4156)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 2),
                    ],
                  ),
                  child: Text(
                    CategoryController.category[i],
                    style: TextStyle(
                        fontSize: FontSize.BODY,
                        color: selectedCategory == CategoryController.category[i]
                            ? Colors.white
                            : Colors.black87),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

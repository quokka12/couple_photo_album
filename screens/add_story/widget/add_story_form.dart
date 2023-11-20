import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'package:photo_album/controller/camera_controller.dart';

import '../../../config/font/my_font_size.dart';
import '../../../config/size/widget_size.dart';
import '../../../controller/category_controller.dart';

class AddStoryForm extends StatefulWidget {
  const AddStoryForm({super.key});

  @override
  State<AddStoryForm> createState() => _AddStoryFormState();
}

class _AddStoryFormState extends State<AddStoryForm> {
  final _formKey = GlobalKey<FormState>();
  late String selectedCategory = '';
  //사진 저장하는 배열
  List<File?> images = <File?>[];
  CameraController cameraController = CameraController();

  final controller_name = TextEditingController();
  final controller_address = TextEditingController();
  final controller_title = TextEditingController();
  final controller_content = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller_address.dispose();
    controller_name.dispose();
    controller_title.dispose();
    controller_content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoryHelper(),
        SizedBox(height: 20),
        addressTextFieldHelper(),
        SizedBox(height: 30),
        TextFieldHelper(controller_name, '장소 이름', '장소 이름을 입력하여 주세요.'),
        SizedBox(height: 30),
        TextFieldHelper(controller_title, '제목', '제목을 입력하여 주세요.'),
        SizedBox(height: 30),
        multiLineTextFieldHelper(controller_content, '내용', '내용을 입력하여 주세요.'),
        SizedBox(height: 10),
        addPhotoButton(),
        imageListHelper(),
        SizedBox(height: 30),
        AddButton(),
      ],
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
                        fontSize: MyFontSize.BODY,
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

  Widget addressTextFieldHelper() {
    getAddressFromAPI() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => KpostalView(
            useLocalServer: false,
            //useLocalServer 속성을 false로 설정하면 KpostalView가 로컬 서버를 사용하지 않고, 카카오 지도로 직접 주소 검색을 수행
            localPort: 1024,
            // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
            callback: (Kpostal result) {
              controller_address.text = '${result.address} ${result.buildingName}';
            },
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => getAddressFromAPI(),
      child: TextFormField(
        readOnly: true,
        autofocus: false,
        minLines: 1,
        maxLines: 2,
        enabled: false,
        decoration: InputDecoration(
          hintText: '주소 검색하기',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        controller: controller_address,
      ),
    );
  }

  Widget TextFieldHelper(TextEditingController controller, String label, String errorMessage) {
    return TextFormField(
      validator: (value) {
        if (value.toString().length < 1)
          return errorMessage;
        else
          return null;
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget multiLineTextFieldHelper(
      TextEditingController controller, String label, String errorMessage) {
    return TextFormField(
      validator: (value) {
        if (value.toString().length < 1)
          return errorMessage;
        else
          return null;
      },
      maxLines: 8,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget addPhotoButton() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () async {
          images.addAll((await cameraController.getImages(images)));
          setState(() {});
        },
        child: Text('사진 추가하기',
            style: TextStyle(fontSize: MyFontSize.BODY, decoration: TextDecoration.underline)),
      ),
    );
  }

  Widget imageListHelper() {
    return Container(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < images.length; i++) ...[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: Text(
                            '사진 삭제',
                            style:
                                TextStyle(fontSize: MyFontSize.BODY, fontWeight: FontWeight.bold),
                          ),
                          content: Text('해당 사진을 정말 삭제하겠습니까?',
                              style: TextStyle(fontSize: MyFontSize.BODY)),
                          actions: [
                            TextButton(
                              child: Text('삭제', style: TextStyle(fontSize: MyFontSize.BODY)),
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  images.removeAt(i);
                                });
                              },
                            ),
                            TextButton(
                              child: Text('닫기', style: TextStyle(fontSize: MyFontSize.BODY)),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      }));
                },
                child: cameraController.imageHelper(images[i]),
              ),
              SizedBox(width: 5),
            ],
          ],
        ),
      ),
    );
  }

  Widget AddButton() {
    return Container(
      alignment: Alignment.center,
      width: WidgetSize.ratioOfHorizontal(context, 1),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFF4156),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '스토리 추가하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: MyFontSize.H4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:customize_tabbar_view/customize_tabbar.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late final data = [
    {"title": "未处理", "id": "0", "isSelected": true},
    {"title": "已处理", "id": "1", "isSelected": false},
    {"title": "退单", "id": "2", "isSelected": false}
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '我的客户',
      ),
      bottom: PreferredSize(
          child: CustomizeTabBar(
            size: const Size(375, 40),
            data: data,
            unSelectedColor: Colors.white,
            selectColor: Colors.tealAccent,
            unSelectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            selectTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            item: 30.0,
            tabBarTapped: (value) {
              debugPrint("CustomizeTabBar----->${value.title}");
            },
          ),
          preferredSize: Size(375, 40)),
    );
  }
}

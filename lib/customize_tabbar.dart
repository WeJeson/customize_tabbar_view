import 'package:flutter/material.dart';

import 'custom_top_tab.dart';

class CustomizeTabBar extends StatefulWidget {
  final Color? selectColor;
  final Color? unSelectedColor;
  final TextStyle? selectTextStyle;
  final TextStyle? unSelectedTextStyle;
  final Size size;
  final double? item;
  final List data;
  final double? intervalRL;
  final double? intervalTB;
  ValueChanged<TabBarModel>? tabBarTapped;

  CustomizeTabBar(
      {Key? key,
      required this.size,
      required this.data,
      this.selectColor = Colors.grey,
      this.unSelectedColor = Colors.white,
      this.unSelectedTextStyle = const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      this.intervalRL = 1.0,
      this.intervalTB = 1.0,
      this.tabBarTapped,
      this.selectTextStyle = const TextStyle(fontSize: 15, color: Colors.white),
      this.item = 10.0})
      : super(key: key);

  @override
  _CustomizeTabBarState createState() => _CustomizeTabBarState();
}

class _CustomizeTabBarState extends State<CustomizeTabBar> {
  late final double item;

  late final double width;

  late List<TabBarModel> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data.isEmpty) return;
    for (var e in widget.data) {
      dataList.add(TabBarModel.fromJson(e));
    }
    item = widget.item!;
    width =
        (widget.size.width - (dataList.length - 1) * item) / dataList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.selectColor,
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: dataList.map<Widget>((e) {
            int index = dataList.indexOf(e);
            if (index == 0) {
              return Positioned(
                left: widget.intervalRL,
                top: widget.intervalTB,
                child: ClipPath(
                    clipper: CustomTopTabOne(item: item),
                    child: GestureDetector(
                        child: Container(
                          key: Key(e.id),
                          width: width + item - widget.intervalRL!,
                          height: widget.size.height - 2 * widget.intervalTB!,
                          alignment: Alignment.center,
                          color: e.isSelected
                              ? widget.selectColor
                              : widget.unSelectedColor,
                          child: Text(e.title,
                              style: e.isSelected
                                  ? widget.selectTextStyle
                                  : widget.unSelectedTextStyle),
                        ),
                        onTap: () {
                          selectTabBar(e);
                        })),
              );
            } else if (index == dataList.length - 1) {
              return Positioned(
                  left: width * index + item * (index - 1) + widget.intervalRL!,
                  top: widget.intervalTB!,
                  child: ClipPath(
                      clipper: CustomTopTabThree(item: item),
                      child: GestureDetector(
                        child: Container(
                          key: Key(e.id),
                          width: width + item - widget.intervalRL!,
                          height: widget.size.height - 2 * widget.intervalTB!,
                          alignment: Alignment.center,
                          color: e.isSelected
                              ? widget.selectColor
                              : widget.unSelectedColor,
                          child: Text(e.title,
                              style: e.isSelected
                                  ? widget.selectTextStyle
                                  : widget.unSelectedTextStyle),
                        ),
                        onTap: () {
                          selectTabBar(e);
                        },
                      )));
            } else {
              return Positioned(
                left: width * index + item * (index - 1) + widget.intervalRL!,
                top: widget.intervalTB!,
                child: ClipPath(
                    clipper: CustomTopTabTwo(item: item),
                    child: GestureDetector(
                      child: Container(
                        key: Key(e.id),
                        width: width + item * 2 - widget.intervalRL!,
                        height: widget.size.height - 2 * widget.intervalTB!,
                        alignment: Alignment.center,
                        color: e.isSelected
                            ? widget.selectColor
                            : widget.unSelectedColor,
                        child: Text(e.title,
                            style: e.isSelected
                                ? widget.selectTextStyle
                                : widget.unSelectedTextStyle),
                      ),
                      onTap: () {
                        selectTabBar(e);
                      },
                    )),
              );
            }
          }).toList(),
        ));
  }

  void selectTabBar(TabBarModel model) {
    widget.tabBarTapped!(model);
    List tempList = dataList;
    setState(() {
      for (var value in tempList) {
        int index = tempList.indexOf(value);
        dataList[index].isSelected = false;
        if (dataList[index].id == model.id) {
          dataList[index].isSelected = true;
        }
      }
    });
  }
}

class TabBarModel {
  late final String title;
  late final String id;
  late bool isSelected;

  TabBarModel(this.title, this.id, this.isSelected);
  TabBarModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    isSelected = json["isSelected"];
  }
}

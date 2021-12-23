import 'package:flutter/material.dart';

class CustomTopTabOne extends CustomClipper<Path> {
  final double? item;
  CustomTopTabOne({this.item});

  @override
  getClip(Size size) {
    double tempItem = 10;
    if (item! < size.width) {
      tempItem = item!;
    }
    // TODO: implement getClip
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width - tempItem, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CustomTopTabTwo extends CustomClipper<Path> {
  final double? item;
  CustomTopTabTwo({this.item});

  @override
  getClip(Size size) {
    double tempItem = 30;
    if (item != null && item! < size.width) {
      tempItem = item!;
    }
    // TODO: implement getClip
    var path = Path();
    path.moveTo(tempItem, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width - tempItem, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(tempItem, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CustomTopTabThree extends CustomClipper<Path> {
  final double? item;
  CustomTopTabThree({this.item});

  @override
  getClip(Size size) {
    double tempItem = 30;
    if (item != null && item! < size.width) {
      tempItem = item!;
    }
    // TODO: implement getClip
    var path = Path();
    path.moveTo(tempItem, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(tempItem, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

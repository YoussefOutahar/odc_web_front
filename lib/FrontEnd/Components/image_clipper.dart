import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double widthOffset = width * 0.3;
    Path path = Path();

    // path.moveTo(0, height * 0.3);
    // path.quadraticBezierTo(
    //     widthOffset, height * 0.4, width * 0.5, height * 0.3);
    // path.quadraticBezierTo(width - widthOffset, height * 0.2, width, 0);
    // path.lineTo(width, height);

    path.lineTo(width - widthOffset, 0);
    path.cubicTo(width, 0, width, height, width - widthOffset, height);
    path.lineTo(width, height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

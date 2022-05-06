import 'dart:math';

import 'package:flutter/material.dart';

class ImageRotated extends StatelessWidget {
  const ImageRotated(
      {Key? key,
      required this.image,
      required this.angle,
      required this.margin,
      required this.width,
      required this.height})
      : super(key: key);
  final double angle;
  final String image;
  final EdgeInsets margin;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: height,
        width: width, //133
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}

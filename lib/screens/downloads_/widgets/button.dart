import 'package:flutter/material.dart';

class ButtonsForDownload extends StatelessWidget {
  const ButtonsForDownload(
      {Key? key,
      required this.color,
      required this.text,
      required this.backgroundcolor,
      required this.padding,
      required this.height,
      required this.fontsize})
      : super(key: key);
  final String text;
  final Color backgroundcolor;
  final EdgeInsets padding;
  final double height;
  final double fontsize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: MaterialButton(
        height: height,
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: color, fontSize: fontsize, fontWeight: FontWeight.bold),
        ),
        color: backgroundcolor,
      ),
    );
  }
}

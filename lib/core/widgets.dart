import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCostmized extends StatelessWidget {
  const AppBarCostmized({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        title,
        style:
            GoogleFonts.montserrat(fontSize: 27, fontWeight: FontWeight.w600),
      ),
      actions: [
        Icon(
          icon,
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 12.h, bottom: 12.h, left: 18, right: 10),
          child: Container(
            width: 24.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}

final spacing = SizedBox(
  width: 50.w,
);

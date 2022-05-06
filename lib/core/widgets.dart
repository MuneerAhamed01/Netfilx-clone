import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCostmized extends StatelessWidget {
  const AppBarCostmized(
      {Key? key, required this.title, required this.icon, this.bottom})
      : super(key: key);
  final String title;
  final IconData icon;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
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

//Title of categories

class HeadingCategories extends StatelessWidget {
  const HeadingCategories({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.padding,
  }) : super(key: key);
  final String text;
  final double fontsize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding, // EdgeInsets.only(left: 12.w)  Indroducing Downloads for you
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontsize.sp),
      ),
    );
  }
}

SizedBox box = SizedBox(
  height: 20.h,
);
SizedBox boxSub = SizedBox(
  height: 10.h,
);

SizedBox boxWidth = SizedBox(
  width: 8.h,
);
SizedBox boxSub5 = SizedBox(
  height: 5.h,
);
SizedBox boxWidth30 = SizedBox(
  width: 30.h,
);

class SliverAppBarCostmized extends StatelessWidget {
  const SliverAppBarCostmized(
      {Key? key, required this.title, required this.icon, required this.tabBar})
      : super(key: key);
  final String title;
  final IconData icon;
  final PreferredSizeWidget tabBar;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      bottom: tabBar,
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

TextStyle styleCategory = const TextStyle(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);

class ListAndText extends StatelessWidget {
  const ListAndText({Key? key, required this.icon, required this.text})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

final styleTextBold = TextStyle(
    color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold);

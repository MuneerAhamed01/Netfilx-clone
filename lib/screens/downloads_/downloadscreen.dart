import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/widgets.dart';
import 'package:netflix/screens/downloads_/widgets/button.dart';
import 'package:netflix/screens/downloads_/widgets/container_stack.dart';

List imageView = [
  "https://terrigen-cdn-dev.marvel.com/content/prod/1x/doctorstrangeinthemultiverseofmadness_lob_crd_02_3.jpg",
  "https://static.metacritic.com/images/products/movies/8/522591463dfe464bc75a8b207247e2a3.jpg",
  "https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/83-et00062705-25-12-2021-02-47-08.jpg"
];

class DownloadsList extends StatelessWidget {
  const DownloadsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: SafeArea(
              minimum: EdgeInsets.only(top: 33.w),
              child: const AppBarCostmized(
                title: "Downloads",
                icon: Icons.cast,
              )),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 14.w),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: grey,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Smart Downloads",
                    style: TextStyle(color: grey, fontSize: 17.sp),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: const Text(
                "Indroducing Downloads for you",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, top: 16.h),
              child: const Text(
                  "We'll download a personalized selection of movies and shows for you,so there's always something to watch on your phone.",
                  style: TextStyle(
                    color: grey,
                    letterSpacing: 0.9,
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: 360.h,
              child: Stack(alignment: Alignment.center, children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[850]!,
                  radius: 125,
                ),
                ImageRotated(
                  width: 120.w,
                  height: 180.h,
                  margin: EdgeInsets.only(right: 150.w, bottom: 30.h),
                  angle: -20,
                  image: imageView[0],
                ),
                ImageRotated(
                  width: 120.w,
                  height: 180.h,
                  margin: EdgeInsets.only(left: 150.w, bottom: 30.h),
                  angle: 20,
                  image: imageView[1],
                ),
                ImageRotated(
                  width: 133.w,
                  height: 200.h,
                  margin: EdgeInsets.only(right: 0.w, top: 5.h),
                  angle: 0,
                  image: imageView[2],
                ),
              ]),
            ),
            ButtonsForDownload(
              text: "Set Up",
              backgroundcolor: buttonBlue!,
              height: 39.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              fontsize: 17.sp,
            ),
            SizedBox(
              height: 50.h,
            ),
            ButtonsForDownload(
                text: "Find More to Download",
                backgroundcolor: Colors.grey[850]!,
                padding: EdgeInsets.symmetric(horizontal: 120.w),
                fontsize: 15.sp,
                height: 32.h)
          ],
        ));
  }
}

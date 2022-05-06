import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:netflix/api/apis.dart';

import '../../core/widgets.dart';
import '../downloads_/downloadscreen.dart';

class TabBarViewItemsComingSoon extends StatelessWidget {
  const TabBarViewItemsComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthFull = 392.72727272727275.w;
    return ListView.builder(
        controller: ScrollController(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ComingSoonBody(
                  widthFull: widthFull,
                  index: index,
                )
              ],
            ),
          );
        });
  }
}

class ComingSoonBody extends StatelessWidget {
  const ComingSoonBody({Key? key, this.widthFull, required this.index})
      : super(key: key);

  final double? widthFull;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(upcoming),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          final snapImage = snapshot.data![index].backdropPath!;
          final snapDate = snapshot.data![index].releaseDate!;
          final dateDay = DateFormat('dd').format(DateTime.parse(snapDate));
          final dateMonth = DateFormat('MMM').format(DateTime.parse(snapDate));
          final snapTitle = snapshot.data![index].originalTitle!;
          final snapTitleOf = snapshot.data![index].title!;
          final snapOverview = snapshot.data![index].overview!;

          return snapshot.hasData
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 10.h),
                        child: Column(
                          children: [
                            Text(
                              dateMonth,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 23.sp),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Text(
                                dateDay,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthFull! - 60.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(imageId + snapImage),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Text(
                                    snapTitle,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                ),
                                const ListAndText(
                                  icon: Icons.add,
                                  text: "Reminds Me",
                                ),
                                boxWidth30,
                                const ListAndText(
                                  icon: Icons.info_outline,
                                  text: "info",
                                ),
                              ],
                            ),
                          ),
                          box,
                          Text(
                            snapTitleOf,
                            style: styleTextBold,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 40.w, top: 6.h),
                            child: Text(
                              snapOverview,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : const Center(
                  child: Text("Loading....."),
                );
        });
  }
}

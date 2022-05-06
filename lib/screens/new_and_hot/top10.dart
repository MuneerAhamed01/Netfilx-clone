import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/api/apis.dart';

import '../../core/widgets.dart';
import '../downloads_/downloadscreen.dart';

class TabBarViewItemsTop10 extends StatelessWidget {
  const TabBarViewItemsTop10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthFull = 392.72727272727275.w;
    return ListView.builder(
        controller: ScrollController(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Top10(
                  widthFull: widthFull,
                  index: index,
                )
              ],
            ),
          );
        });
  }
}

class Top10 extends StatelessWidget {
  const Top10({Key? key, this.widthFull, required this.index})
      : super(key: key);

  final double? widthFull;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(top10),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 10.h),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
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
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(imageId +
                                      snapshot.data![index].backdropPath!),
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
                                    snapshot.data![index].originalTitle!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 60.w,
                                ),
                                const ListAndText(
                                  icon: Icons.share,
                                  text: "Share",
                                ),
                                boxWidth30,
                                const ListAndText(
                                  icon: Icons.add,
                                  text: "My List",
                                ),
                                boxWidth30,
                                const ListAndText(
                                  icon: Icons.play_arrow,
                                  text: "Play",
                                ),
                              ],
                            ),
                          ),
                          boxSub,
                          Text(
                            snapshot.data![index].title!,
                            style: styleTextBold,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 40.w, top: 6.h),
                            child: Text(
                              snapshot.data![index].overview!,
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

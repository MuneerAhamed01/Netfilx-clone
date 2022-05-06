import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/api/apis.dart';

import '../../core/widgets.dart';
import '../downloads_/downloadscreen.dart';

class TabBarViewItemsEveryone extends StatelessWidget {
  const TabBarViewItemsEveryone({Key? key}) : super(key: key);

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
                EveryoneWaching(
                  widthFull: widthFull,
                  index: index,
                )
              ],
            ),
          );
        });
  }
}

class EveryoneWaching extends StatelessWidget {
  const EveryoneWaching({Key? key, this.widthFull, required this.index})
      : super(key: key);

  final double? widthFull;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(nowPlaying),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widthFull,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
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
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110.w,
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
                              snapshot.data![index].originalTitle!,
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

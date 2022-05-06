import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/api/apis.dart';
import 'package:netflix/core/widgets.dart';
import 'package:netflix/screens/downloads_/downloadscreen.dart';
import 'package:netflix/screens/downloads_/widgets/container_stack.dart';
import 'package:netflix/screens/fast_laugh/api_for_video/videofile.dart';

class SearchBarAvailable extends StatelessWidget {
  const SearchBarAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingCategories(
            text: "Movies & TV",
            fontsize: 28,
            padding: EdgeInsets.only(left: 7.w, top: 17.h)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: FutureBuilder(
                future: getMovies(top10),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 160),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return snapshot.hasData
                          ? ImageRotated(
                              image:
                                  imageId + snapshot.data![index].posterPath!,
                              angle: 0,
                              margin: const EdgeInsets.all(0),
                              width: 120.w,
                              height: 180.h)
                          : const Center(
                              child: Text("Loading..."),
                            );
                    },
                    itemCount: 20,
                  );
                }),
          ),
        )
      ],
    );
  }
}

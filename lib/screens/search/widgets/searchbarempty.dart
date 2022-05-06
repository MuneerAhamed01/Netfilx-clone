import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/api/apis.dart';
import 'package:netflix/core/widgets.dart';
import 'package:netflix/screens/downloads_/downloadscreen.dart';

import 'miniwidgets.dart';

class SearchBarEmpty extends StatelessWidget {
  const SearchBarEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingCategories(
            text: "Top Searches",
            fontsize: 28,
            padding: EdgeInsets.only(left: 7.w, top: 17.h)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: FutureBuilder(
                future: getMovies(popularImages),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  return snapshot.hasData
                      ? ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 14.h,
                          ),
                          itemBuilder: (context, index) {
                            return SearchListView(
                              url:
                                  imageId + snapshot.data![index].backdropPath!,
                              title: snapshot.data![index].title!,
                            );
                          },
                          itemCount: snapshot.data!.length,
                        )
                      : const Center(
                          child: Text("Loading..."),
                        );
                }),
          ),
        )
      ],
    );
  }
}

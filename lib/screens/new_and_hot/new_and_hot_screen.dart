import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/screens/new_and_hot/coming_soon.dart';
import 'package:netflix/screens/new_and_hot/everyone_watching.dart';
import 'package:netflix/screens/new_and_hot/top10.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

import '../../core/widgets.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: SafeArea(
              minimum: EdgeInsets.only(top: 33.w),
              child: const AppBarCostmized(
                title: "New & Hot",
                icon: Icons.cast,
              ),
            ),
          ),
          body: ScrollableListTabView(tabHeight: 50, tabs: [
            ScrollableListTab(
                tab: const ListTab(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    label: Text("🍿 Coming soon"),
                    activeBackgroundColor: Colors.white,
                    inactiveBackgroundColor: Colors.black),
                body: const CustomScrollView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: TabBarViewItemsComingSoon(),
                    )
                  ],
                )),
            ScrollableListTab(
                tab: const ListTab(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    label: Text("👀 Everyone Watching"),
                    activeBackgroundColor: Colors.white,
                    inactiveBackgroundColor: Colors.black),
                body: const CustomScrollView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: TabBarViewItemsEveryone(),
                    )
                  ],
                )),
            ScrollableListTab(
                tab: const ListTab(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    label: Text("🔝 Top 10"),
                    activeBackgroundColor: Colors.white,
                    inactiveBackgroundColor: Colors.black),
                body: const CustomScrollView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: TabBarViewItemsTop10(),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

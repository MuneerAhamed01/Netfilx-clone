import 'package:flutter/material.dart';
import 'package:netflix/screens/downloads_/downloadscreen.dart';
import 'package:netflix/screens/fast_laugh/fast_laugh_screen.dart';
import 'package:netflix/screens/home/homescreen.dart';
import 'package:netflix/screens/new_and_hot/new_and_hot_screen.dart';
import 'package:netflix/screens/search/search_screen.dart';

import 'widgets/bottomnav.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final _pages = [
    HomeScreen(),
    const NewAndHot(),
    const FastLaugh(),
    const SearchScreen(),
    const DownloadsList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: bottomNavIndex,
            builder: (context, int index, _) {
              return _pages[index];
            }),
        bottomNavigationBar: const BottomNav());
  }
}

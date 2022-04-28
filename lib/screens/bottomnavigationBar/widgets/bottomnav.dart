import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors.dart';

ValueNotifier<int> bottomNavIndex = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bottomNavIndex,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            iconSize: 23.sp,
            selectedFontSize: 13.sp,
            unselectedFontSize: 13.sp,
            backgroundColor: backgroundColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (value) {
              bottomNavIndex.value = value;
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600],
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined), label: "New & Hot"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  label: "Fast Laughs"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline), label: "Downloads"),
            ],
          );
        });
  }
}

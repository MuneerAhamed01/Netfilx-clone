import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/screens/search/widgets/miniwidgets.dart';
import 'package:netflix/screens/search/widgets/searchbarempty.dart';
import 'package:netflix/screens/search/widgets/searchresult.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool change = false;
  @override
  Widget build(BuildContext context) {
    print(change);
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarField(
              onTap: (value) {
                setState(() {
                  change = true;
                });
              },
            ),
            Expanded(
                child: change
                    ? const SearchBarAvailable()
                    : const SearchBarEmpty())
          ],
        ),
      ),
    ));
  }
}

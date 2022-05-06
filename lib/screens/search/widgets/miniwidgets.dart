import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: Row(
        children: [
          Container(
            width: 140.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 150,
            decoration: const BoxDecoration(color: Colors.black),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.play_circle_outlined,
            color: Colors.white,
            size: 47.sp,
          )
        ],
      ),
    );
  }
}

class SearchBarField extends StatelessWidget {
  const SearchBarField({Key? key, required this.onTap}) : super(key: key);
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: CupertinoSearchTextField(
        style: const TextStyle(color: Colors.white),
        onSubmitted: onTap,
        prefixInsets: EdgeInsets.only(right: 6.w, left: 10.w),
        prefixIcon: Icon(
          CupertinoIcons.search,
          size: 15.sp,
        ),
        itemColor: Colors.white60,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.grey[800], borderRadius: BorderRadius.circular(5.r)),
      ),
    );
  }
}

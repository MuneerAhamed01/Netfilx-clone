import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/screens/bottomnavigationBar/bottomnavbar.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 825.4545454545455),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, child) => MediaQuery(
                data: const MediaQueryData(textScaleFactor: 0.7),
                child: child!),
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                cardColor: Colors.transparent,
                scaffoldBackgroundColor: backgroundColor),
            home: BottomNavBar(),
          );
        });
  }
}

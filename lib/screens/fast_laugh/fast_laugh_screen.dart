import 'package:flutter/material.dart';
import 'package:netflix/screens/fast_laugh/api_for_video/videofile.dart';
import 'package:netflix/screens/fast_laugh/widgets/video_list.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(top: 33),
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(videos.length, (index) {
                  return TheReels(
                    uri: videos[index],
                    index: index,
                  );
                }))));
  }
}

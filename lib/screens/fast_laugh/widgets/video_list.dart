import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/screens/fast_laugh/api_for_video/videofile.dart';
import 'package:video_player/video_player.dart';
import '../../../core/widgets.dart';
import '../../downloads_/downloadscreen.dart';

class TheReels extends StatefulWidget {
  const TheReels({Key? key, required this.index, required this.uri})
      : super(key: key);
  final int index;
  final String uri;

  @override
  State<TheReels> createState() => _TheReelsState();
}

class _TheReelsState extends State<TheReels> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.uri);
    _controller.initialize().then((_) {
      _controller.play().then((value) => _controller.setLooping(true));
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(
                  color: Colors.black,
                  child: const Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()))),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w, bottom: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.w, bottom: 8.h),
                child: Icon(
                  Icons.volume_mute_sharp,
                  color: Colors.white,
                  size: 29.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 6.w, bottom: 6.h),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(images[widget.index]),
                        radius: 28.r,
                      ),
                    ),
                    box,
                    IconsOfReels(
                      padding: EdgeInsets.only(right: 19.w),
                      icon: Icons.emoji_emotions_rounded,
                      size: 30.sp,
                      title: "LOL",
                    ),
                    box,
                    IconsOfReels(
                      padding: EdgeInsets.only(right: 18.w),
                      icon: Icons.add,
                      size: 30.sp,
                      title: "My List",
                    ),
                    box,
                    IconsOfReels(
                      padding: EdgeInsets.only(right: 18.w),
                      icon: Icons.send,
                      size: 28.sp,
                      title: "Share",
                    ),
                    box,
                    IconsOfReels(
                      padding: EdgeInsets.only(right: 18.w),
                      icon: Icons.play_arrow,
                      size: 35.sp,
                      title: "Play",
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class IconsOfReels extends StatelessWidget {
  const IconsOfReels({
    Key? key,
    required this.icon,
    required this.size,
    required this.title,
    required this.padding,
  }) : super(key: key);
  final IconData icon;
  final double size;
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: size,
          ),
          boxSub,
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

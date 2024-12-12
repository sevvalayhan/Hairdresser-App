import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PostMediaController extends GetxController {
  final PageController pageController = PageController();
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void initializeVideo(String url) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}

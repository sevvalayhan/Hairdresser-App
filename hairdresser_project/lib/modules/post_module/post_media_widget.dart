import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/static/custom_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class PostMediaWidget extends StatefulWidget {
  final Post post;
  const PostMediaWidget({
    super.key,
    required this.post,
  });

  @override
  State<PostMediaWidget> createState() => _PostMediaWidgetState();
}

class _PostMediaWidgetState extends State<PostMediaWidget> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 300,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.post.postMediaList!.length,
                  itemBuilder: (context, index) {
                    if (widget.post.postMediaList?[index].mediaType == MediaType.video) {
                      _videoPlayerController = VideoPlayerController.networkUrl(
                          Uri.parse(widget.post.postMediaList![index].mediaUrl));
                      _chewieController = ChewieController(
                        videoPlayerController: _videoPlayerController!,
                        autoPlay: true,
                        looping: true,
                      );
                      return FutureBuilder(
                          future: _videoPlayerController!.initialize(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Chewie(controller: _chewieController!);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          });
                    } else if (widget.post.postMediaList![index].mediaType == MediaType.image) {
                      return CachedNetworkImage(
                        imageUrl: widget.post.postMediaList![index].mediaUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const AnimatedProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const SizedBox();
                    }
                  })),
          const SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: widget.post.postMediaList!.length,
            effect: const ScrollingDotsEffect(dotHeight: 8.0, dotWidth: 8.0),
          )
        ],
      );
    }
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({super.key});

  @override
  _AnimatedProgressIndicatorState createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: CircularProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(CustomColors.lightGreen),
          ),
        ),
      ],
    );
  }
}

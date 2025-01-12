import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/post_media_controller.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/post_media.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class PostMediaWidget extends StatelessWidget {
  final Post post;
  PostMediaWidget({
    super.key,
    required this.post,
    this.postMediaHeight,
  });
  PostMediaController postMediaController = Get.put(PostMediaController());
  double? postMediaHeight = 300;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            height: postMediaHeight,
            child: PageView.builder(
                controller: postMediaController.pageController,
                itemCount: post.postMediaList.isNotEmpty
                    ? post.postMediaList.length
                    : 0,
                itemBuilder: (context, index) {
                  if (post.postMediaList.isNotEmpty) {
                    if (post.postMediaList[index].mediaType ==
                        MediaType.video) {
                      String url = post.postMediaList[index].mediaUrl;
                      postMediaController.initializeVideo(url);
                      return FutureBuilder(
                          future: postMediaController.videoPlayerController!
                              .initialize(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Chewie(
                                  controller:
                                      postMediaController.chewieController!);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          });
                    } else if (post.postMediaList[index].mediaType ==
                        MediaType.image) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: post.postMediaList[index].mediaUrl,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const AnimatedProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  }
                  return const SizedBox();
                })),
        const SizedBox(
          height: 20,
        ),
        post.postMediaList.length > 1
            ? SmoothPageIndicator(
                controller: postMediaController.pageController,
                count: post.postMediaList.length,
                effect:
                    const ScrollingDotsEffect(dotHeight: 8.0, dotWidth: 8.0),
              )
            : const SizedBox()
      ],
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({super.key});

  @override
  State<AnimatedProgressIndicator> createState() =>
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

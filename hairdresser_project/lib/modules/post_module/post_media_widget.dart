import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/static/custom_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostMediaWidget extends StatefulWidget {
  final List<String>? postImageUrlList;
  final String? videoUrl;
  const PostMediaWidget({
    super.key,
    this.postImageUrlList,
    this.videoUrl,
  });

  @override
  State<PostMediaWidget> createState() => _PostMediaWidgetState();
}

class _PostMediaWidgetState extends State<PostMediaWidget> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    if (widget.postImageUrlList != null &&
        widget.postImageUrlList!.isNotEmpty) {
      return SizedBox(
          height: 300,
          child: Stack(children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.postImageUrlList!.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.postImageUrlList![index],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const AnimatedProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(                  
                  controller: _pageController,
                  count: widget.postImageUrlList!.length,
                  effect:  const JumpingDotEffect()
                  
                ),
              ),
            ),
          ]));
    } else {
      return const SizedBox();
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';

class CustomImageFetcher extends StatelessWidget {
  const CustomImageFetcher({
    super.key, required this.imageUrl,
  });
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(      
      
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const AnimatedProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}

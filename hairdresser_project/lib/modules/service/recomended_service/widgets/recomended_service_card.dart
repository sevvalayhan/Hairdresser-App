import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

class RecomendedServiceCard extends StatelessWidget {
  const RecomendedServiceCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: SizedBox(
                  height: ResponsiveMesurement.asHeight(context, 30),
                  width:ResponsiveMesurement.asWidth(context, 40),
                  child: serviceImage()),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(service.title,maxLines: 1,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }

  ClipRRect serviceImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: service.serviceFirstImage,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const AnimatedProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}

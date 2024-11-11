import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';

class RecomendedServiceCard extends StatelessWidget {
  const RecomendedServiceCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                  height: screenHeight / 7,
                  width: screenWidth / 2,
                  child: serviceImage(service, screenHeight, screenWidth)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(service.serviceTitle)
        ],
      ),
    );
  }

  Container serviceImage(
      Service service, double screenHeight, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: service.serviceImage.imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const AnimatedProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

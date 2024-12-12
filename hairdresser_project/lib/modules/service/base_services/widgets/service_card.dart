import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * .01, horizontal: screenWidth * .02),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .04, vertical: screenHeight * .02),
          child: SizedBox(
            width: screenWidth / 3,
            height: screenHeight * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: serviceImageContainer(screenHeight)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  service.title,
                  style: montserratBold.copyWith(fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cut_outlined,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "", // "${service.barber.firstName} ${service.barber.lastName}",
                        style: montserratMedium.copyWith(
                          fontSize: 10,
                          color: Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "60 dk • 500 TL",
                  style: montserratMedium.copyWith(
                      fontSize: 14, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Randevu Al",
                      style: montserratMedium.copyWith(
                        fontSize: 16,
                        color: CustomColors.lightPink,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container serviceImageContainer(double screenHeight) {
    return Container(
      height: screenHeight / 5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: service.serviceFirstImage ,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const AnimatedProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

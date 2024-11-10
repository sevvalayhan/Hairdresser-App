import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({super.key, required this.service});
  final Service service;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
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
                Expanded(child: serviceImage(screenHeight)),
                const SizedBox(height: 5,),
                Text(
                  widget.service.serviceTitle,
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
                        "${widget.service.barber.barberName} ${widget.service.barber.barberSurname}",
                        style: montserratMedium.copyWith(
                          fontSize: 10,
                          color: Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  
                ),
                const SizedBox(height: 5,),
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

  Container serviceImage(double screenHeight) {
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
          imageUrl:
              "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const AnimatedProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

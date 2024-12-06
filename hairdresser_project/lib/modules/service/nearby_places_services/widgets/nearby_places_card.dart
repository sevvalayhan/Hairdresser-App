import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:hairdresser_project/widgets/favorite_button.dart';

class NearbyPlacesCard extends StatelessWidget {
  const NearbyPlacesCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight / 7,
              width: screenWidth / 4,
              child: Stack(children: [
                Positioned(
                    child: serviceImage(service.serviceImages[0].image)),
                const Positioned(top: 2, right: 5, child: FavoriteButton()),
              ]),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    service.title,
                    style: montserratSemiBold,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: CustomColors.lightPink,
                      ),
                      Text( 
                        "${service.barber.user.addresses}, ${service.barber.user.addresses[0].district.districtName} ",
                        style: montserratSmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                       CircleAvatar(
                        radius: 10,
                        child: CustomImageFetcher(
                            imageUrl:  service.barber.profileImage),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                       "${service.barber.firstName} ${service.barber.lastName}",
                        style: montserratSmall,
                      )
                    ],
                  ),
                  ServiceScore(
                      screenWidth: screenWidth, screenHeight: screenHeight)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container serviceImage(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomImageFetcher(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

class ServiceScore extends StatelessWidget {
  const ServiceScore({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth / 9,
      height: screenHeight / 40,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CustomColors.lila.withOpacity(.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: CustomColors.yellow,
              size: 15,
            ),
            Text(
              "4.5",
              style: montserratSmall,
            ) //puan gelecek
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:hairdresser_project/widgets/favorite_button.dart';
import 'package:hairdresser_project/widgets/service_score.dart';

class NearbyPlacesCard extends StatelessWidget {
  const NearbyPlacesCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
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
              child: Stack(children: [
                Positioned(child: serviceImageContainer(context)),
                const Positioned(top: 2, right: 5, child: FavoriteButton()),
              ]),
            ),
            const SizedBox(
              width: 10,
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
                  BarberAddressWithPinIcon(
                    iconSize: 15,
                    barber: service.barber,
                    locationIcon: Icon(
                      Icons.location_on_rounded,
                      color: CustomColors.lightPink,
                    ),
                    style: montserratSmall,
                  ),
                  barberInformation(context),
                  const ServiceScore()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row barberInformation(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ResponsiveMesurement.asHeight(context, 2.5),
          height: ResponsiveMesurement.asHeight(context, 2.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImageFetcher(imageUrl: service.barber.profileImage),
          ),
        ),
        const SizedBox(width: 2),
        Text(
          "${service.barber.firstName} ${service.barber.lastName}",
          style: montserratSmall,
        )
      ],
    );
  }

  SizedBox serviceImageContainer(BuildContext context) {
    return SizedBox(
      height: double.infinity, //ResponsiveMesurement.asHeight(context, 25),
      width: ResponsiveMesurement.asWidth(context, 28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomImageFetcher(
          imageUrl: service.serviceFirstImage,
        ),
      ),
    );
  }
}

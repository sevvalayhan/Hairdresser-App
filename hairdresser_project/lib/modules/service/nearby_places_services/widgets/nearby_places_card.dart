import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:hairdresser_project/widgets/favorite_button.dart';
import 'package:hairdresser_project/widgets/service_score.dart';

class NearbyPlacesCard extends StatelessWidget {
  const NearbyPlacesCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.serviceDetail,
          arguments: service,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        elevation: 10,
        child: SizedBox(
          height: ResponsiveMesurement.asHeight(context, 25),
          width: ResponsiveMesurement.asWidth(context, 70),
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
                serviceCardBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded serviceCardBody(BuildContext context) {
    return Expanded(
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
          barberAddress(context),         
          barberInformation(context),
          const ServiceScore()
        ],
      ),
    );
  }

  Row barberAddress(BuildContext context) {
    return Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: CustomColors.lightPink,
              size: 15,
            ),
            const SizedBox(
              width: 1,
            ),
            SizedBox(
              width: ResponsiveMesurement.asWidth(context, 28),
              child: Text(
                "${service.barber.user.addresses[0].district.province.provinceName}, ${service.barber.user.addresses[0].district.districtName} ",
                style: montserratSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
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

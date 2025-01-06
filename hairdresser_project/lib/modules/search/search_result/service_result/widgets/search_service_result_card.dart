import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

// ignore: must_be_immutable
class SearchServiceResultCard extends StatelessWidget {
  SearchServiceResultCard({super.key, required this.service});
  Service service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.serviceDetail,
            arguments: service, );
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.lightPink.withOpacity(.5),
              ),
              borderRadius: BorderRadius.circular(8)),
          height: ResponsiveMesurement.asHeight(context, 40),
          width: ResponsiveMesurement.asWidth(context, 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                serviceImage(context),
                Text(service.title,
                    style: montserratBold.copyWith(
                      color: CustomColors.black.withOpacity(.6),
                    )),
                Text("${service.price} TL | ${service.duration} dk",
                    style: montserratMedium.copyWith(
                      color: CustomColors.lightPink,
                    )),
                barberInformation(context),
                BarberAddressWithPinIcon(
                  stringSize: 30,
                    barber: service.barber,
                    style: montserratSmall.copyWith(
                        color: CustomColors.black.withOpacity(.6)),
                    locationIcon: const Icon(Icons.location_on_rounded),
                    iconSize: 20),
                appointmentButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center appointmentButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ResponsiveMesurement.asWidth(context, 40),
        height: ResponsiveMesurement.asHeight(context, 4),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: CustomColors.lightPink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7))),
            onPressed: () {},
            child: Text(
              "Randevu Al",
              style: montserratMedium.copyWith(color: CustomColors.white),
            )),
      ),
    );
  }

  ClipRRect serviceImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: ResponsiveMesurement.asHeight(context, 19),
        width: ResponsiveMesurement.asWidth(context, 45),
        child: CustomImageFetcher(imageUrl: service.serviceImages[0].image),
      ),
    );
  }

  Row barberInformation(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        barberProfilImage(context),
        const SizedBox(
          width: 5,
        ),
        Text(
          "${service.barber.firstName} ${service.barber.lastName}",
          style: montserratSmall.copyWith(),
        ),
      ],
    );
  }

  ClipRRect barberProfilImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: ResponsiveMesurement.asHeight(context, 2.1),
        width: ResponsiveMesurement.asWidth(context, 5),
        child: CustomImageFetcher(imageUrl: service.barber.profileImage),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

class ServiceCardWithAppointmentButton extends StatelessWidget {
  const ServiceCardWithAppointmentButton({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.serviceDetail, arguments: service);
      },
      child: SizedBox(
        height: ResponsiveMesurement.asHeight(context, 20),
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: CustomColors.lightPink),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  serviceImage(context),
                  const SizedBox(width: 10),
                  cardBody(context),
                ],
              ),
            )),
      ),
    );
  }

  Expanded cardBody(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(service.title, style: montserratBold),
          Row(
            children: [
              Text(
                "${service.price} TL |",
                style: montserratSemiBold.copyWith(
                  fontWeight: FontWeight.w800,
                  color: CustomColors.lightPink,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.access_time_rounded,
                color: CustomColors.lightPink,
                size: 15,
              ),
              const SizedBox(width: 5),
              Text(
                "1 saat",
                style: montserratSmall.copyWith(
                  color: CustomColors.lightPink,
                ),
              ),
            ],
          ),
          BarberAddressWithPinIcon(
            stringSize: 45,
              barber: service.barber,
              style: montserratSmall,
              locationIcon: const Icon(Icons.pin_drop_outlined),
              iconSize: 15),
          barberInformation(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Kızlar için",
                  style: montserratSmall.copyWith(
                    color: CustomColors.lightPink,
                  )),
              appointmentButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Row barberInformation(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ResponsiveMesurement.asHeight(context, 3),
          height: ResponsiveMesurement.asHeight(context, 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImageFetcher(imageUrl: service.barber.profileImage),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "${service.barber.firstName} ${service.barber.lastName}",
          style: montserratSmall,
        )
      ],
    );
  }

  SizedBox serviceImage(BuildContext context) {
    return SizedBox(
      height: ResponsiveMesurement.asHeight(context, 20),
      width: ResponsiveMesurement.asWidth(context, 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomImageFetcher(
          imageUrl: service.serviceFirstImage,
        ),
      ),
    );
  }
}

Widget appointmentButton(BuildContext context) {
  return SizedBox(
      height: ResponsiveMesurement.asHeight(context, 4),
      width: ResponsiveMesurement.asWidth(context, 25),
      child: FloatingActionButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [CustomColors.black, CustomColors.lightPink],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints:
                  const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Randevu Al",
                textAlign: TextAlign.center,
                style: montserratSmall.copyWith(
                  color: CustomColors.white,
                ),
              ),
            ),
          )));
}

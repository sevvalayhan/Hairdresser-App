import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

class ServiceCardWithAppointmentButton extends StatelessWidget {
  const ServiceCardWithAppointmentButton({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: screenHeight / 5,
      width: double.infinity,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: CustomColors.lightPink),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                serviceImageCard(service.serviceImages[0].image,
                    screenHeight, screenWidth),
                const SizedBox(width: 8),
                cardBody(screenHeight, screenWidth),
              ],
            ),
          )),
    );
  }

  Expanded cardBody(double screenHeight, double screenWidth) {
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
          Row(
            children: [
              Icon(
                Icons.pin_drop_outlined,
                color: CustomColors.black,
              ),
              Expanded(
                child: Text(
               "",//   "${service.barber.user.address!.country.province.provinceName}, ${service.barber.user.address!.country.province.district.districtName}",
                  style: montserratSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 10,
                child:
                    CustomImageFetcher(imageUrl: "")//service.barber.profileImage),
              ),
              const SizedBox(width: 10),
              Text(
           "",//     "${service.barber.firstName} ${service.barber.lastName}",
                style: montserratSmall,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Kızlar için",
                  style: montserratSmall.copyWith(
                    color: CustomColors.lightPink,
                  )),
              appointmentButton(screenHeight, screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  Container serviceImageCard(
      String imageUrl, double screenHeight, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints(
          minHeight: screenHeight / 5, minWidth: screenWidth / 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: CustomImageFetcher(
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  SizedBox appointmentButton(double screenHeight, double screenWidth) {
    return SizedBox(
        height: screenHeight / 25,
        width: screenWidth / 3.5,
        child: FloatingActionButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
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
}

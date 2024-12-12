import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

class SearchNearbyService extends StatelessWidget {
  const SearchNearbyService({super.key, required this.service});
  final Service service;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        decoration: BoxDecoration(color: CustomColors.lightPink.withOpacity(.05),borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  serviceImageContainer(size),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        " ${service.title}",
                        style: montserratLargeBold,
                      ), const  SizedBox(
                        height: 3,
                      ),
                      BarberAddressWithPinIcon(
                          iconSize: 15,
                          barber: service.barber,
                          style: montserratSmall.copyWith(
                              color: CustomColors.black.withOpacity(.7)),
                          locationIcon: const Icon(Icons.pin_drop_outlined)),
                    const  SizedBox(
                        height: 3,
                      ),
                      Text(
                        " ${service.price} TL",
                        style: montserratMedium.copyWith(
                            color: CustomColors.lightPink),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: CustomColors.lightPink,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container serviceImageContainer(Size size) {
    return Container(
      width: size.width / 6,
      height: size.height / 15,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomImageFetcher(
          imageUrl:service.serviceFirstImage   ,
        ),
      ),
    );
  }
}

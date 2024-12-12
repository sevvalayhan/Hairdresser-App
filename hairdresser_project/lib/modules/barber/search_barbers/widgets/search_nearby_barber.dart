import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

class SearchNearbyBarber extends StatelessWidget {
  const SearchNearbyBarber({super.key, required this.barber});
  final Barber barber;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: CustomColors.lightPink),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  barberProfileImage(size),
                  const SizedBox(
                    width: 15,
                  ),
                  barberInformation(),
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

  Column barberInformation() {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BarberAddressWithImageIcon(
                        iconSize: 15,
                        barber: barber,
                        style: montserratMedium.copyWith(fontSize: 10,
                            color: CustomColors.black.withOpacity(.5)),
                        iconImageUrl: "assets/icon_image/placemarker.png"),
                    Text(
                      " ${barber.firstName} ${barber.lastName}",
                      style: montserratLargeBold.copyWith(
                          color: CustomColors.lightPink),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                );
  }

  Container barberProfileImage(Size size) {
    return Container(
      width: size.width / 6,
      height: size.height / 10,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomImageFetcher(
          imageUrl: barber.profileImage,
        ),
      ),
    );
  }
}

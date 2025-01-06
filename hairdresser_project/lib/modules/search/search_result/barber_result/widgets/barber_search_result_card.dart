import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

// ignore: must_be_immutable
class BarberSearchResultCard extends StatelessWidget {
  BarberSearchResultCard({super.key, required this.barber});
  Barber barber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(barber);
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
                barberImage(context),
                barberInformation(context),
                BarberAddressWithPinIcon(
                  stringSize: 30,
                    barber: barber,
                    style: montserratSmallBold.copyWith(
                        color: CustomColors.black.withOpacity(.6)),
                    locationIcon: const Icon(Icons.location_on_rounded),
                    iconSize: 20),
                categoryNameList(context),
                const SizedBox()
               // const AppointmentButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryNameList(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ResponsiveMesurement.asWidth(context, 38),
        height: ResponsiveMesurement.asHeight(context, 10),
        child: GridView.builder(
          itemCount: barber.categories.length>6?6:barber.categories.length,
          itemBuilder: (builder, index) {
            return categoryName(barber.categories[index].categoryName);
          },
          gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: barber.categories.length>2?2:barber.categories.length,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 3.5),
        ),
      ),
    );
  }

  Row categoryName(String categoryName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.square_rounded,
          color: CustomColors.lightPink.withOpacity(.7),
          size: 5,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          categoryName,
          style: montserratSmallBold.copyWith(color: CustomColors.black.withOpacity(.6)),
        )
      ],
    );
  }

  ClipRRect barberImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: ResponsiveMesurement.asHeight(context, 18),
        width: ResponsiveMesurement.asWidth(context, 45),
        child: CustomImageFetcher(imageUrl: barber.profileImage),
      ),
    );
  }

  Widget barberInformation(BuildContext context) {
    return Text(
      barber.shopName,
      style: montserratLargeBold.copyWith(
          color: CustomColors.black, fontWeight: FontWeight.w900),
    );
  }
}

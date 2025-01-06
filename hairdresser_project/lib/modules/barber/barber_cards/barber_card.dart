import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/barber_address_with_pin_icon.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

class BarberCard extends StatelessWidget {
  const BarberCard({super.key, required this.barber});
  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: SizedBox(
          height: ResponsiveMesurement.asHeight(context, 23),
          width: double.infinity,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomColors.lightPink.withOpacity(.5), width: .5),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    barberImage(context),
                    const SizedBox(width: 20),
                    cardBody(context),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget categoryNameList(BuildContext context) {
    print("barber.categories.length: ${barber.categories.length}");
    return SizedBox(
      width: ResponsiveMesurement.asWidth(context, 40),
      height: ResponsiveMesurement.asHeight(context, 10),
      child: GridView.builder(
        itemCount: barber.categories.length>6?6:barber.categories.length,
        itemBuilder: (builder, index) {
          return categoryName(barber.categories[index].categoryName);
        },
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:barber.categories.length<2?barber.categories.length:2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: 3.5),
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
          style: montserratSmallBold.copyWith(
              color: CustomColors.black.withOpacity(.6)),
        )
      ],
    );
  }

  Expanded cardBody(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" ${barber.shopName}", style: montserratLarge),
          BarberAddressWithPinIcon(
            stringSize: 50,
              barber: barber,
              style: montserratSmall,
              locationIcon: const Icon(Icons.pin_drop_outlined),
              iconSize: 15),
          categoryNameList(context), 
        ],
      ),
    );
  }

 

  SizedBox barberImage(BuildContext context) {
    return SizedBox(
      height: ResponsiveMesurement.asHeight(context, 20),
      width: ResponsiveMesurement.asWidth(context, 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomImageFetcher(
          imageUrl: barber.profileImage,
        ),
      ),
    );
  }
}

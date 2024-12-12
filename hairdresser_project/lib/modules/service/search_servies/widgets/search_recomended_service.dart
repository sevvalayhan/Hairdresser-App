import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SearchRecomendedService extends StatelessWidget {
  const SearchRecomendedService({
    super.key,
    required this.service,
  });
  final Service service;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: CustomColors.lightPink.withOpacity(.4), width: .7),
            borderRadius: BorderRadius.circular(10)),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  serviceImageContainer(size),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    service.title,
                    style: montserratLargeBold,
                  ),
                ],
              ),
              showAllButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container serviceImageContainer(Size size) {
    return Container(
      width: size.width / 5.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomImageFetcher(
          imageUrl: service.serviceFirstImage,
        ),
      ),
    );
  }

  Row showAllButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Tümünü Gör",
          style: montserratSmall.copyWith(color: CustomColors.lightPink),
        ),
        const SizedBox(
          width: 1,
        ),
        Icon(
          Iconsax.arrow_circle_right,
          color: CustomColors.lightPink,
          size: 15,
        ),
        const SizedBox(
          width: 3,
        )
      ],
    );
  }
}

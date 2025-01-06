import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';

class BarberProfilImageWidget extends StatelessWidget {
  const BarberProfilImageWidget(
      {super.key, required this.imageUrl, required this.circleDiameter});
  final String imageUrl;
  final double circleDiameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: CustomColors.grey)),
      width: circleDiameter,
      height: circleDiameter,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: CustomImageFetcher(imageUrl: imageUrl),
      ),
    );
  }
}

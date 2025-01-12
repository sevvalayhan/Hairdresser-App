import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/barber.dart'; 
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

class BarberHomepageProfileCard extends StatelessWidget {
  const BarberHomepageProfileCard({super.key, required this.barber});
  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.barberDetailsPage, arguments: barber);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: ResponsiveMesurement.asWidth(context, 8),
                child: ClipOval(
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(50),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: barber.profileImage)))),
            SizedBox(
              height: ResponsiveMesurement.asHeight(context, 1),
            ),
            Text(
              (barber.shopName).length > 10
                  ? "${(barber.shopName).substring(0, 10)}..."
                  : barber.shopName,
              style: montserratLarge.copyWith(
                  fontSize: ResponsiveMesurement.fontPercent(context, 3)),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

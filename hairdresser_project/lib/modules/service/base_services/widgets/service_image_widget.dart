import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ServiceImageWidget extends StatelessWidget {
  ServiceImageWidget(
      {super.key, required this.sizePercent, required this.service});
  final double sizePercent;
  final Service service;
  ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: ResponsiveMesurement.asHeight(context, sizePercent),
            child: service.serviceImages.isNotEmpty
                ? PageView.builder(
                    controller: serviceController.pageController,
                    itemCount: service.serviceImages.isNotEmpty
                        ? service.serviceImages.length
                        : 0,
                    itemBuilder: (context, index) => CustomImageFetcher(
                        imageUrl: service.serviceImages[index].image),
                  )
                : const SizedBox()),
        Positioned(
            bottom: 10,
            left: ResponsiveMesurement.asWidth(context, 40),
            child: SmoothPageIndicator(
              controller: serviceController.pageController,
              count: service.serviceImages.length,
              effect: JumpingDotEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  dotColor: CustomColors.white,
                  activeDotColor: CustomColors.lightPink),
            ))
      ],
    );
  }
}

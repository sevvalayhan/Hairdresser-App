import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/modules/barber/homepage_barbers.dart/widgets/barber_homepage_profile_card.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

// ignore: must_be_immutable
class BarberProfileList extends StatelessWidget {
  BarberProfileList({super.key});

  BarberController barberController = Get.put(BarberController());

  @override
  Widget build(BuildContext context) {
    double vertical = ResponsiveMesurement.asHeight(context, 13 );
    return Obx(
      () => SizedBox(
        height: vertical,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: barberController.barberList.length,
          itemBuilder: (context, index) => BarberHomepageProfileCard(
            barber: barberController.barberList[index],
          ),
        ),
      ),
    );
  }
}

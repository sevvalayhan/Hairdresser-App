import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/modules/barber/barber_cards/barber_card.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
// ignore: must_be_immutable
class MobileBarbersPage extends StatelessWidget {
  MobileBarbersPage({super.key});
  BarberController barberController = Get.put(BarberController());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            filterButtons(context),
            Obx(() {
              if (barberController.barberList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: List.generate(
                  barberController.barberList.length,
                  (index) {
                    return BarberCard(barber: barberController.barberList[index]);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  SizedBox filterButtons(BuildContext context) {
    return SizedBox(
      height: ResponsiveMesurement.asHeight(context, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          filterIcon(
              context,
              Icon(
                Iconsax.arrow_up,
                size: 50,
                color: CustomColors.lightPink,
              ),
              "Yükselenler"),
          filterIcon(
              context,
              ImageIcon(
                const AssetImage(
                  "assets/icon_image/placemarker.png",
                ),
                color: CustomColors.lightPink,
                size: 50,
              ),
              "Yakındakiler"),
          filterIcon(
              context,
              Icon(
                Icons.star,
                size: 50,
                color: CustomColors.lightPink,
              ),
              "Favoriler"),
          filterIcon(
              context,
              Icon(
                Icons.mark_chat_read_rounded,
                size: 50,
                color: CustomColors.lightPink,
              ),
              "Geçmiş"),
        ],
      ),
    );
  }

  Widget filterIcon(BuildContext context, Widget icon, String filterName) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ResponsiveMesurement.asHeight(context, 8),
            height: ResponsiveMesurement.asHeight(context, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: CustomColors.lila.withOpacity(.1),
            ),
            child: Center(child: icon),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              child: Text(
            filterName,
            style: montserratSmall,
          ))
        ],
      ),
    );
  }
}

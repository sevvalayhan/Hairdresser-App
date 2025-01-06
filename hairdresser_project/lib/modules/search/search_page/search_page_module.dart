import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/barber/search_barbers/search_barbers_module.dart';
import 'package:hairdresser_project/modules/service/search_servies/search_service_module.dart';

// ignore: must_be_immutable
class SearchPageModule extends StatelessWidget {
  SearchPageModule({super.key});
  BarberController barberController = Get.put(BarberController());
  ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return barberController.searchBarberList.isNotEmpty
                ? Column(
                    children: [
                      SearchBarbersModule(),
                      Divider(
                        color: CustomColors.lightPink,
                        endIndent: 10,
                        indent: 10,
                      ),
                    ],
                  )
                : const SizedBox();
          }),
          Obx(() {
            return serviceController.searchServiceList.isNotEmpty
                ? SearchServiceModule()
                : const SizedBox();
          })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/service/base_services/widgets/service_card_with_appointment.dart';

// ignore: must_be_immutable
class BaseServiceModule extends StatelessWidget {
  BaseServiceModule({super.key});
  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
        if (serviceController.serviceList.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ServiceCardWithAppointmentButton(
              service: serviceController.serviceList[index],
            ),
          );
        } else {
          return const SizedBox(
            child: Text("data"),
          );
        }
      },
              childCount: serviceController.serviceList.length > 3
                  ? 3
                  : serviceController.serviceList.length)),
    );
  }
}

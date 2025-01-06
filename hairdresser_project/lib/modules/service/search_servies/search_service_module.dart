import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/service/search_servies/widgets/search_nearby_service.dart';

// ignore: must_be_immutable
class SearchServiceModule extends StatelessWidget {
  SearchServiceModule({
    super.key,
  });
  ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
          Column(
          children: [
            Column(
              children: [
                recomendedStyleText(),
                Column(
                  children: List.generate(
                      serviceController.searchServiceList.length > 15
                          ? 15
                          : serviceController.searchServiceList.length,
                      (index) => SearchNearbyService(
                            service: serviceController.searchServiceList[index],
                          )),
                ),
              ],
            )
          ],
        ),
 
    );
  }

  Padding recomendedStyleText() {
    return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Önerilen Stiller",
                      style: montserratLargeBold.copyWith(
                          color: CustomColors.lightPink),
                    )
                  ],
                ),
              );
  }
}

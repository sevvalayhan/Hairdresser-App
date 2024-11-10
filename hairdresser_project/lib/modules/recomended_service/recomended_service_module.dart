import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/recomended_service/widgets/recomended_service_card.dart';
import 'package:hairdresser_project/screens/home/home_page.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

// ignore: must_be_immutable
class RecomendedServiceListView extends StatelessWidget {
  RecomendedServiceListView({
    super.key,
  });
  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            decoration: BoxDecoration(
                border: Border.all(color: CustomColors.lightPink),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SeeDetails(
                      detailsName: "Önerilenler", pageName: "/favoritesPage"),
                  SizedBox(
                      height: size.height * .40,
                      child: serviceController.filteredServiceList.isNotEmpty
                          ? Expanded(
                              child: GridView.builder(
                                  cacheExtent: 20,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: serviceController
                                      .filteredServiceList.length,
                                  itemBuilder: (context, index) =>
                                      RecomendedServiceCard(
                                          service: serviceController
                                              .filteredServiceList[index])),
                            )
                          : const Center(
                              child: Text("liste boş"),
                            )),
                ],
              ),
            ),
          ),
        ));
  }
}

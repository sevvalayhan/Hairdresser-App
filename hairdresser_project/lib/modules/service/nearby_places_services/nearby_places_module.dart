import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/service/nearby_places_services/widgets/nearby_places_card.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/see_details.dart';

// ignore: must_be_immutable
class NearbyPlacesModule extends StatelessWidget {
  NearbyPlacesModule({
    super.key,
  });
  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: ResponsiveMesurement.asHeight(context, 50)),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [CustomColors.pink, CustomColors.white]),
                border: Border.all(color: CustomColors.lightPink),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                    SeeDetails(
                      detailsName: "Size Yakın",
                      pageName: AppRoutes.nearbyServicesPage,id: NavigationKey.home.index,),
                  Center(
                    child: SizedBox(
                        height: ResponsiveMesurement.asHeight(context, 40),
                        child: serviceController.serviceList.isNotEmpty
                            ? GridView.builder(
                                cacheExtent: 25,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, childAspectRatio: .5),
                                scrollDirection: Axis.horizontal,
                                itemCount: serviceController.serviceList.length,
                                itemBuilder: (context, index) => NearbyPlacesCard(
                                    service:
                                        serviceController.serviceList[index]),
                              )
                            : const Center(
                                child: Text("liste boş"),
                              )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

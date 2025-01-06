import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/search/search_result/service_result/widgets/search_service_result_card.dart';
import 'package:hairdresser_project/widgets/list_empty_widget.dart';

// ignore: must_be_immutable
class ServiceSearchResultModule extends StatelessWidget {
  ServiceSearchResultModule({super.key});
  ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: serviceController.searchServiceList.isNotEmpty
          ? GridView.builder(
            
              itemCount: serviceController.searchServiceList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .55),
              itemBuilder: (BuildContext context, int index) {
                return SearchServiceResultCard(
                  service: serviceController.searchServiceList[index],
                );
              })
          : const ListEmptyWidget(),
    );
  }
}

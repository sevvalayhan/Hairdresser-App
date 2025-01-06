import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/modules/search/search_result/barber_result/widgets/barber_search_result_card.dart';
import 'package:hairdresser_project/widgets/list_empty_widget.dart';

// ignore: must_be_immutable
class BarberSearchResultModule extends StatelessWidget {
  BarberSearchResultModule({super.key});
  BarberController barberController = Get.put(BarberController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: barberController.searchBarberList.isNotEmpty
          ? GridView.builder(
              itemCount: barberController.searchBarberList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .55),
              itemBuilder: (BuildContext context, int index) {
                return BarberSearchResultCard(
                    barber: barberController.searchBarberList[index]);
              })
          : const ListEmptyWidget(),
    );
  }
}

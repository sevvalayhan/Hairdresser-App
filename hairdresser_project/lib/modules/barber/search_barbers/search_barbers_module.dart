import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/modules/barber/search_barbers/widgets/search_nearby_barber.dart';

// ignore: must_be_immutable
class SearchBarbersModule extends StatelessWidget {
  SearchBarbersModule({super.key});
  BarberController barberController = Get.put(BarberController());
  @override
  Widget build(BuildContext context) {
    int barberListLenght = barberController.searchBarberList.length;
    return SingleChildScrollView(
      child: Column(children: [Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Önerilen Kuaförler",
                style:
                    montserratLargeBold.copyWith(color: CustomColors.lightPink),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: barberListLenght > 10 ? 10 : barberListLenght,
              itemBuilder: (context, index) {
                return SearchNearbyBarber(
                  barber: barberController.searchBarberList[index],
                );
              }),
        ),
      ]),
    );
  }
}

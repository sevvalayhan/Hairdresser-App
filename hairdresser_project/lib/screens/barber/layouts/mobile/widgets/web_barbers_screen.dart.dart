import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/modules/barber/barber_cards/barber_card.dart'; 

// ignore: must_be_immutable
class WebBarbersPage extends StatelessWidget {
  WebBarbersPage({super.key});
  BarberController barberController = Get.put(BarberController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(
          barberController.barberList.length,
          (index) => BarberCard(barber: barberController.barberList[index]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/bottom_nav_bar_controller.dart';
import 'package:hairdresser_project/navigation/home_navigation.dart';
import 'package:hairdresser_project/screens/appointment/appointment_screen.dart';
import 'package:hairdresser_project/screens/barber/barbers_page.dart';
import 'package:hairdresser_project/screens/map_page.dart';
import 'package:hairdresser_project/widgets/custom_navigation_bar.dart';

// ignore: must_be_immutable
class MobileDashboardScreen extends StatelessWidget {
  MobileDashboardScreen({super.key});

  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Obx(
            ()=> IndexedStack(
              index:bottomNavBarController.currentIndex.value,
                    children:const [
            HomeNavigation(),
            BarbersPage(),
            MapPage(),
            AppointmentScreen()
                    ],
                  ),
          )),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

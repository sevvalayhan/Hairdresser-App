import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/bottom_nav_bar_controller.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            montserratMedium.copyWith(
                fontSize: 11, color: CustomColors.lightPink),
          ),
        ),
        child: Obx(
          () => NavigationBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shadowColor: CustomColors.lightPink,
            selectedIndex: bottomNavBarController.currentIndex.value,
            indicatorColor: Colors.white,
            elevation: 2,
            onDestinationSelected: (index) {
              bottomNavBarController.currentIndex.value = index; 
              
                         
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: CustomColors.lightPink,
                ),
                selectedIcon:
                    Icon(Icons.home_rounded, color: CustomColors.lightPink),
                label: "Ana Sayfa",
              ),
              NavigationDestination(
                icon: ImageIcon(
                  const AssetImage("assets/icon_image/barbershop_outlined.png"),
                  color: CustomColors.lightPink,
                ),
                selectedIcon: ImageIcon(
                  const AssetImage("assets/icon_image/barbershop.png"),
                  color: CustomColors.lightPink,
                ),
                label: "Kuaförler",
              ),
              NavigationDestination(
                icon: Icon(Icons.pin_drop_outlined,
                    color: CustomColors.lightPink),
                selectedIcon:
                    Icon(Icons.pin_drop, color: CustomColors.lightPink),
                label: "Yakınlarda Ara",
              ),
              NavigationDestination(
                icon: ImageIcon(
                  const AssetImage(
                      "assets/icon_image/appointment_outlined.png"),
                  color: CustomColors.lightPink,
                ),
                selectedIcon: ImageIcon(
                  const AssetImage("assets/icon_image/appointment.png"),
                  color: CustomColors.lightPink,
                ),
                label: "Randevularım",
              ),
            ],
          ),
        ));
  }
}

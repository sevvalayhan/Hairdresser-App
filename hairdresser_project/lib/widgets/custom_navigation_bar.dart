import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            montserratMedium.copyWith(
                fontSize: 11, color: CustomColors.lightPink),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: CustomColors.lightPink,
          selectedIndex: homePageController.currentIndex.value,
          indicatorColor: Colors.white,
          elevation: 2,
          onDestinationSelected: (index) {
            homePageController.currentIndex.value = index;
            print(index);
            switch (index) {
              case 0:
                Get.toNamed('/homePage');
                break;
              case 1:
                Get.toNamed('/barbers');
                break;
              case 2:
                Get.toNamed('/map');
                break;
              case 3:
                Get.toNamed('/appointment');
                break;
            }
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
              icon: Icon(Icons.pin_drop_outlined, color: CustomColors.lightPink),
              selectedIcon: Icon(Icons.pin_drop, color: CustomColors.lightPink),
              label: "Yakınlarda Ara",
            ),
            NavigationDestination(
              icon:  ImageIcon(
                const AssetImage("assets/icon_image/appointment_outlined.png"),
                color: CustomColors.lightPink,
              ),
              selectedIcon:  ImageIcon(
                const AssetImage("assets/icon_image/appointment.png"),
                color: CustomColors.lightPink,
              ),
              label: "Randevularım",
            ),
          ],
        ));
  }
}

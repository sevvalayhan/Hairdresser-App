import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/screens/home/home_screen.dart';
import 'package:hairdresser_project/screens/home/layouts/mobile/widgets/search_page.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavigationKey.home.index),
      onGenerateRoute: (settings) {
        print(settings.name);
        switch (settings.name) {
          case AppRoutes.home:
            return GetPageRoute(
                page: () => const HomeScreen(),
                transition: Transition.circularReveal);
          case AppRoutes.searchPage:
            return GetPageRoute(
                page: () => SearchPage(),
                transition: Transition.circularReveal);
          default:
            return GetPageRoute(
                page: () => const HomeScreen(),
                transition: Transition.circularReveal);
        }
      },
    );
  }
}

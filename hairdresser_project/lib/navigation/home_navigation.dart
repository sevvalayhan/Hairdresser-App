import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/screens/home/home_screen.dart';
import 'package:hairdresser_project/screens/search/search_page.dart';
import 'package:hairdresser_project/screens/search/search_result_page.dart';
import 'package:hairdresser_project/screens/service/nearby_service_list_page.dart';
import 'package:hairdresser_project/screens/service/service_details_page.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavigationKey.home.index),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return GetPageRoute(
                page: () => const HomeScreen(),
                transition: Transition.noTransition);
          case AppRoutes.searchPage:
            return GetPageRoute(
                page: () => SearchPage(),
                transition: Transition.noTransition);
          case AppRoutes.searchResultPage:
            return GetPageRoute(
                page: () => SearchResultPage(),
                transition: Transition.noTransition);
          case AppRoutes.serviceDetail:
            return GetPageRoute(
                page: () => ServiceDetail(),
                transition: Transition.noTransition);
          case AppRoutes.nearbyServicesPage:
            return GetPageRoute(
                page: () => NearbyServicesListPage(),
                transition: Transition.noTransition);
          default:
            return GetPageRoute(
                page: () => const HomeScreen(),
                transition: Transition.noTransition,);
        }
      },
    );
  }
}

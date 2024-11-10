import 'package:get/get.dart';
import 'package:hairdresser_project/routes/app_routes.dart';
import 'package:hairdresser_project/screens/favorites_page.dart';
import 'package:hairdresser_project/screens/home/home_page.dart';
import 'package:hairdresser_project/screens/map_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () =>   HomePage()),   
    GetPage(name: AppRoutes.appointment, page: () => const FavoritesPage()),
    GetPage(name: AppRoutes.barbers, page: () => const FavoritesPage()),
    GetPage(name: AppRoutes.map, page: () => const MapPage()),
  ];
}

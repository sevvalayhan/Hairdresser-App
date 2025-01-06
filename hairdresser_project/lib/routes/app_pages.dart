import 'package:get/get.dart';
import 'package:hairdresser_project/screens/barber/barber_details_page.dart';
import 'package:hairdresser_project/screens/service/nearby_service_list_page.dart';
import 'package:hairdresser_project/screens/service/service_details_page.dart';
import 'package:hairdresser_project/screens/appointment/appointment_screen.dart';
import 'package:hairdresser_project/screens/barber/barbers_page.dart';
import 'package:hairdresser_project/screens/dashboard/dashboard_screen.dart';
import 'package:hairdresser_project/screens/home/home_screen.dart';
import 'package:hairdresser_project/screens/home/layouts/mobile/widgets/home_body.dart';
import 'package:hairdresser_project/screens/search/search_page.dart';
import 'package:hairdresser_project/screens/map_page.dart';
import 'package:hairdresser_project/screens/search/search_result_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.homeBody, page: () => HomeBody()),
    GetPage(name: AppRoutes.appointment, page: () => const AppointmentScreen()),
    GetPage(name: AppRoutes.barbers, page: () => const BarbersPage()),
    GetPage(name: AppRoutes.map, page: () => const MapPage()),
    GetPage(name: AppRoutes.searchPage, page: () => SearchPage()),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardScreen()),
    GetPage(name: AppRoutes.serviceDetail, page: () => ServiceDetail()),
    GetPage(name: AppRoutes.searchResultPage, page: () => SearchResultPage()),
    GetPage(name: AppRoutes.nearbyServicesPage, page: () => NearbyServicesListPage()),
    GetPage(name: AppRoutes.barberDetailsPage, page: () => BarberDetailsPage()),
  ];
}

class AppRoutes {
  static const String home = '/homePage';
  static const String homeBody = '/homeBody';
  static const String appointment = '/appointment';
  static const String barbers = '/barbers';
  static const String map = '/map';
  static const String favorites = '/favorites';
  static const String searchPage = '/searchPage';
  static const String dashboard = '/';
  static const String searchResultPage = '/searchResultPage';
  static const String serviceDetail = '/serviceDetail';
  static const String nearbyServicesPage = '/nearbyServicesPage'; 
  static const String barberDetailsPage = '/barberDetailsPage'; 
}

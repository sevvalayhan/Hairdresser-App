import 'package:get/get.dart';
import 'package:hairdresser_project/screens/appointment/appointment_screen.dart';
import 'package:hairdresser_project/screens/barber/barbers_page.dart';
import 'package:hairdresser_project/screens/dashboard/dashboard_screen.dart';
import 'package:hairdresser_project/screens/home/home_screen.dart';
import 'package:hairdresser_project/screens/home/layouts/mobile/widgets/home_body.dart';
import 'package:hairdresser_project/screens/home/layouts/mobile/widgets/search_page.dart';
import 'package:hairdresser_project/screens/map_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),    
    GetPage(name: AppRoutes.homeBody, page: () =>   HomeBody()),   
    GetPage(name: AppRoutes.appointment, page: () => const AppointmentScreen()),
    GetPage(name: AppRoutes.barbers, page: () => const BarbersPage()),
    GetPage(name: AppRoutes.map, page: () => const MapPage()), 
    GetPage(name: AppRoutes.searchPage, page: () =>  SearchPage()), 
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardScreen()), 
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
}



// class AppRouter {
//   static final GoRouter  router = GoRouter(
//     initialLocation: '/dashboard/home',
//     routes: [
//       GoRoute(
//         path: '/auth_screen',
//         builder: (context, state) => const AuthScreen(),
//       ),
//       GoRoute(
//         path: '/create_account_screen',
//         builder: (context, state) => const CreateAccountScreen(),
//       ),
//       GoRoute(
//         path: '/forgot_password_screen',
//         builder: (context, state) => const ForgotPasswordScreen(),
//       ),
//       GoRoute(
//         path: '/reset_password_screen',
//         builder: (context, state) => const ResetPasswordScreen(),
//       ),
//       GoRoute(
//         path: '/product-details',
//         builder: (context, state) => const ProductDetailsScreen(),
//       ),
//       ShellRoute(
//         navigatorKey: GlobalKey<NavigatorState>(),
//         builder: (context, state, child) => DashboardScreen(child: child),
//         routes: [
//           GoRoute(
//             path: '/dashboard/home',
//             builder: (context, state) => const HomeScreen(),
//             routes: [
//               GoRoute(
//                 path: 'search-suggestions',
//                 builder: (context, state) => const SearchSuggestionsScreen(),
//               ),
//               GoRoute(
//                 path: 'search-result',
//                 builder: (context, state) => const SearchReslutsScreen(),
//               ),
//             ],
//           ),
//           GoRoute(
//             path: '/dashboard/favorites',
//             builder: (context, state) => const FavoritesScreen(),
//           ),
//           GoRoute(
//             path: '/dashboard/cart',
//             builder: (context, state) => const CartScreen(),
//           ),
//           GoRoute(
//             path: '/dashboard/categories',
//             builder: (context, state) => const CategoriesScreen(),
//           ),
//           GoRoute(
//             path: '/dashboard/profile',
//             builder: (context, state) => const ProfileScreen(),
//           ),
//           GoRoute(
//             path: '/dashboard/notifications',
//             builder: (context, state) => const NotificationScreen(),
//           ),
//         ],
//       ),
//     ],
//   );
// }


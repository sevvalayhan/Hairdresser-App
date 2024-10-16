import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/screens/home_screens/post_list_page.dart';
import 'package:hairdresser_project/screens/home_screens/home_widgets/custom_drawer.dart';
import 'package:hairdresser_project/screens/favorites_page.dart';
import 'package:hairdresser_project/screens/map_page.dart';
import 'package:hairdresser_project/static/custom_colors.dart';
import 'package:hairdresser_project/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  final List<Map<String, dynamic>> _screens = [
    {'title': 'Kuaförler', 'page': const FavoritesPage()},
    {'title': 'Ana Sayfa', 'page': const PostListPage()},
    {'title': 'Randevularım', 'page': const MapPage()},
    {'title': 'Harita', 'page': const MapPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: _screens[_currentIndex]['title'],
        fontSize: 20,
      ),
      drawer: const CustomDrawer(),
      body: _screens[_currentIndex]['page'],
       bottomNavigationBar: NavigationBarTheme(
    data: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(
        montserratMedium.copyWith(fontSize: 11), 
      ),
    ),
    child: NavigationBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: CustomColors.lightPink,
      selectedIndex: _currentIndex,
      indicatorColor: Colors.white,
      elevation: 2,
      onDestinationSelected: (index) => setState(() {
        _currentIndex = index;
      }),
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.content_cut_sharp),
          selectedIcon: Icon(
            Icons.content_cut_sharp,
            color: CustomColors.lightPink,
          ),
          label: "Kuaförler",
        ),
        NavigationDestination(
          icon: const Icon(Icons.home_rounded),
          selectedIcon: Icon(
            Icons.home_rounded,
            color: CustomColors.lightPink,
          ),
          label: "Ana Sayfa",
        ),
        NavigationDestination(
          icon: const Icon(Icons.history),
          selectedIcon: Icon(
            Icons.history,
            color: CustomColors.lightPink,
          ),
          label: "Randevularım",
        ),
        NavigationDestination(
          icon: const Icon(Icons.map_outlined),
          selectedIcon: Icon(
            Icons.map,
            color: CustomColors.lightPink,
          ),
          label: "Yakınlarda Ara",
        ),
      ],
    ),
  ),

    );
  }
}

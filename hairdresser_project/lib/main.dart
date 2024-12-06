import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/routes/app_routes.dart';
import 'package:hairdresser_project/screens/home/home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppRoutes.home,
        getPages: AppPages.pages,
        theme: ThemeData(
          drawerTheme: DrawerThemeData(backgroundColor: CustomColors.white),
          scaffoldBackgroundColor: CustomColors.white,
          appBarTheme: AppBarTheme(color: CustomColors.white,),
          fontFamily: 'Montserrat',
        ),
        home: HomePage());
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/controllers/post_controller.dart';
import 'package:hairdresser_project/controllers/service_controller.dart'; 
import 'package:hairdresser_project/screens/home/layouts/mobile/widgets/home_body.dart'; 
import 'package:hairdresser_project/widgets/home_widgets/custom_drawer.dart'; 
import 'package:hairdresser_project/widgets/custom_appbar.dart';  

// ignore: must_be_immutable
class MobileHomeScreen extends StatelessWidget {
  MobileHomeScreen({super.key});

  PostController postController = Get.put(PostController());
  HomePageController homePageController = Get.put(HomePageController());
  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Ana Sayfa",
        fontSize: 20,
      ),
      drawer: const CustomDrawer(),
      body: HomeBody(),
      //body: const HomeNavigation() , //home navigationu burada yanlış kullandık, bunu dashboard'da kullanacağız
    );
  }
}

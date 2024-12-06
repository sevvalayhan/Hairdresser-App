import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/controllers/post_controller.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/barber/barber_homepage_profile_module.dart';
import 'package:hairdresser_project/modules/category/category_button_module.dart';
import 'package:hairdresser_project/modules/service/nearby_places_services/nearby_places_module.dart';
import 'package:hairdresser_project/modules/service/recomended_service/recomended_service_module.dart';
import 'package:hairdresser_project/modules/service/base_services/base_service_module.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_drawer.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/widgets/custom_appbar.dart';
import 'package:hairdresser_project/widgets/custom_navigation_bar.dart';
import 'package:hairdresser_project/widgets/custom_search_bar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  PostController postController = Get.put(PostController());

  HomePageController homePageController = Get.put(HomePageController());

  ServiceController serviceController = Get.put(ServiceController());

  final List<String> categoryNames = [
    "Hepsi",
    "Saç Kesimi",
    "Cilt Bakımı",
    "Saç Bakımı",
    "Saç Boyama",
    "Makyaj"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppbar(
        title: "Ana Sayfa",
        fontSize: 20,
      ),
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {},
              child: CustomSearchBar(
                size: size,
              ),
            ),
          ),
          SliverToBoxAdapter(child: BarberProfileList()),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: CategoryButtonList(
              categoryNames: categoryNames,
            ),
          ),
          SliverToBoxAdapter(
            child: RecomendedServiceListView(),
          ),
          SliverToBoxAdapter(
            child: NearbyPlacesModule(),
          ),
          BaseServiceModule(),
          const SliverToBoxAdapter(
            child: SeeDetails(detailsName: "", pageName: "/"),
          ),
         // PostListPage(),
          const SliverToBoxAdapter(
            child: SeeDetails(detailsName: "", pageName: "/"),
          ),
       
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class SeeDetails extends StatelessWidget {
  const SeeDetails({
    super.key,
    required this.detailsName,
    required this.pageName,
  });

  final String detailsName;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            detailsName,
            style: montserratSemiBold,
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(pageName);
            },
            child: Row(
              children: [
                Text("Devamını gör",
                    style: montserratMedium.copyWith(
                      color: CustomColors.lightPink,
                    )),
                  Icon(Icons.keyboard_arrow_right_rounded ,color: CustomColors.lightPink,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

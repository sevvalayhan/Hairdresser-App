import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/search_page_controller.dart';
import 'package:hairdresser_project/modules/barber/homepage_barbers.dart/barber_homepage_profile_module.dart';
import 'package:hairdresser_project/modules/category/category_button_module.dart';
import 'package:hairdresser_project/modules/post/post_list_module.dart';
import 'package:hairdresser_project/modules/service/base_services/base_service_module.dart';
import 'package:hairdresser_project/modules/service/nearby_places_services/nearby_places_module.dart';
import 'package:hairdresser_project/modules/service/recomended_service/recomended_service_module.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/widgets/filter_icon_button.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_search_bar.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  HomeBody({
    super.key,
  });

  final List<String> categoryNames = [
    "Hepsi",
    "Saç Kesimi",
    "Cilt Bakımı",
    "Saç Bakımı",
    "Saç Boyama",
    "Makyaj"
  ];
  SearchPageController searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSearchContainer(
                sizePercent: 78,
                nextScreen: AppRoutes.searchPage,
              ),
              const FilterIconButton()
            ],
          ),
        ),
        SliverToBoxAdapter(child: BarberProfileList()),
        const SliverToBoxAdapter(
          child: SizedBox(height: 5),
        ),
        SliverToBoxAdapter(
          child: CategoryButtonList(
            categoryNames: categoryNames,
          ),
        ),
        SliverToBoxAdapter(
          child: RecomendedServiceListView(), /* */
        ),
        SliverToBoxAdapter(
          child: NearbyPlacesModule(), /* */
        ),
        BaseServiceModule(),
        // const SliverToBoxAdapter(
        //   child: SeeDetails(detailsName: "", pageName: "/"),
        // ),
        PostListPage(),
        // const SliverToBoxAdapter(
        //   child: SeeDetails(detailsName: "", pageName: "/"),
        // ),
      ],
    );
  }
}

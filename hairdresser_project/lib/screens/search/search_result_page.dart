import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/search_result_page_controller.dart';
import 'package:hairdresser_project/modules/search/search_result/barber_result/barber_search_result_module.dart';
import 'package:hairdresser_project/modules/search/search_result/service_result/service_search_result_module.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/widgets/back_page_button.dart';
import 'package:hairdresser_project/widgets/filter_icon_button.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_search_bar.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({super.key});

  final List<Widget> tabList = [
    ServiceSearchResultModule(),
    BarberSearchResultModule()
  ];
  final SearchResultPageController searchResultPageController =
      Get.put(SearchResultPageController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        body: Column(
          children: [
            pageAppBar(AppRoutes.home, NavigationKey.home.index),
            tabBar(context),
            Expanded(
              child: TabBarView(
                children: tabList,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBar(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: .2,
      indicatorPadding: const EdgeInsets.all(8),
      indicatorColor: CustomColors.lightPink.withOpacity(.7),
      labelColor: CustomColors.lightPink,
      unselectedLabelColor: CustomColors.lightPink,
      splashBorderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      tabs: const [
        Tab(
          text: "Stiller",
        ),
        Tab(
          text: "Kuaförler",
        )
      ],
    );
  }

  Container tabWidget(String text, Color textColor) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: 40,
      child: Center(
        child: Text(
          text,
          style: montserratLarge.copyWith(
            color: CustomColors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Padding pageAppBar(String backButtonRouteUrl, int navigationKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackPageButton(
            route: backButtonRouteUrl,
            navigationKey: navigationKey,
          ),
          CustomSearchContainer(
              sizePercent: 70, nextScreen: AppRoutes.searchPage),
          const FilterIconButton(),
        ],
      ),
    );
  }
}
